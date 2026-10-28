#!/usr/bin/env bash
# kit-lint: consistency checks for skills and graphs. POSIX tools only (grep/sed/awk/find).
# Graph nodes must use the one-line flow style: - {id: ..., needs: [...], out: ...}
# Checks: skill refs, graph coverage, Output/Done-when headings, placeholders, research/ out paths,
# shared out paths, node layout, duplicate ids, needs that point at no node in the same file.
cd "$(dirname "$0")/.." || exit 1
FAILF=$(mktemp); trap 'rm -f "$FAILF"' EXIT   # pipes run in subshells, so failures are counted in a file
bad() { echo "kit-lint FAIL: $*"; echo x >> "$FAILF"; }
SK=.claude/skills
ALLOW_UNREFERENCED=""                 # skills not in any graph
ALLOW_SHARED_OUT="research/poc.md research/gtm.md research/approvals.md app/"  # revised or logged in place by a later node
echo "allow-list (skills not in a graph): ${ALLOW_UNREFERENCED:-none}"
echo "allow-list (out shared by two nodes): $ALLOW_SHARED_OUT"
echo "allow-list (research/ out not in a SKILL.md): outputs of skill: manual nodes"

# Parse each node line into: file|id|skill|out-paths (one per line, flow-mapping layout).
nodes=$(for f in graphs/*.yaml; do
  grep -E '^- \{id:' "$f" | awk -v f="$f" '{
    id=$0; sub(/^- \{id: */,"",id); sub(/,.*/,"",id)
    sk=$0; sub(/.*skill: */,"",sk); sub(/,.*/,"",sk)
    o=$0; sub(/.*, out: */,"",o)
    if (substr(o,1,1)=="[") { sub(/\].*/,"",o); sub(/^\[/,"",o) }
    else if (substr(o,1,1)=="\"") { o=substr(o,2); sub(/".*/,"",o) }
    else sub(/,.*/,"",o)
    n=split(o,a,/, */); for(i=1;i<=n;i++) print f "|" id "|" sk "|" a[i]
  }'
done)

# g. node layout, duplicate ids, needs that exist
for f in graphs/*.yaml; do
  grep -nE '^[[:space:]]*-[[:space:]]' "$f" | grep -vE '^[0-9]+:- \{id:' | while read -r l; do bad "$f: node not in one-line flow style: $l"; done
  ids=$(grep -E '^- \{id:' "$f" | sed -E 's/^- \{id: *([^,]+),.*/\1/')
  echo "$ids" | sort | uniq -d | while read -r d; do [ -n "$d" ] && bad "$f: duplicate node id $d"; done
  grep -E '^- \{id:' "$f" | sed -nE 's/.*needs: *\[([^]]*)\].*/\1/p' | tr ',' '\n' | sed 's/ //g' | grep -v '^$' | sort -u | while read -r nd; do
    echo "$ids" | grep -qx "$nd" || bad "$f: needs '$nd' has no node in this file"
  done
done
# a. every skill: in graphs has a SKILL.md
echo "$nodes" | awk -F'|' '$3!="manual"{print $3}' | sed 's|^/||' | sort -u | while read -r s; do
  [ -f "$SK/$s/SKILL.md" ] || bad "graph references /$s but $SK/$s/SKILL.md is missing"
done
# b. every skill dir is referenced by a graph
for d in "$SK"/*/; do
  s=$(basename "$d")
  echo "$nodes" | awk -F'|' '{print $3}' | grep -qx "/$s" || case " $ALLOW_UNREFERENCED " in *" $s "*) ;; *) bad "skill $s is in no graph node";; esac
done
# c. Output and Done when
for d in "$SK"/*/; do
  s=$(basename "$d")
  grep -q '^## Output' "$d/SKILL.md" || bad "$s: no '## Output' heading"
  grep -q '^## Done when' "$d/SKILL.md" || bad "$s: no '## Done when' heading"
done
# d. placeholders
hits=$(grep -nE 'TODO|TBD|\[DATE\]' "$SK"/*/SKILL.md graphs/*.yaml)
[ -z "$hits" ] || bad "placeholder text found:
$hits"
# e. research/, showcase/ and site/ outputs are named in the node's OWN SKILL.md (<x> and * as
#    wildcards; a bare wildcard such as research/*.md matches nothing; a dir out such as site/ needs a
#    named file inside it) or come from a manual node
echo "$nodes" | awk -F'|' '$4 ~ /^(research|showcase|site)\//{print $3 "|" $4}' | while IFS='|' read -r sk out; do
  [ "$sk" = manual ] && continue
  sf="$SK/${sk#/}/SKILL.md"; [ -f "$sf" ] || continue
  pats=$(grep -hoE '(research|showcase|site)/[A-Za-z0-9_<>*./-]+' "$sf" | sed -E 's/[.]+$//; s/<[^>]*>/*/g' | grep -vE '^[a-z]+/[*][.A-Za-z0-9]*$' | sort -u)
  ok=0; set -f; for p in $pats; do case "$out" in $p|$p/*) ok=1; break;; esac; case "$out" in */) case "$p" in "$out"*) ok=1; break;; esac;; esac; done; set +f
  [ $ok = 1 ] || bad "$out (node skill $sk) is not named in $sf"
done
# f. no shared out paths
echo "$nodes" | awk -F'|' '$4!="-"{print $4}' | sort | uniq -d | while read -r p; do
  case " $ALLOW_SHARED_OUT " in *" $p "*) ;; *) bad "out path $p is shared by two nodes";; esac
done
[ -s "$FAILF" ] && exit 1
echo "kit-lint: OK"
