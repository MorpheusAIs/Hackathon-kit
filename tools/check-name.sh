#!/usr/bin/env bash
# Availability check for name candidates. Prints a markdown table.
#
# Usage: tools/check-name.sh <name> [<name> ...]
#   e.g. tools/check-name.sh shopwise tallyhand
# Plain bash + curl + whois. Works from any shell, agent or CLI.
#
# Checked by machine: domains (RDAP, then whois), GitHub, YouTube, X. "?" = no clear answer
# (some whois clients, e.g. macOS, return nothing for .app): check that one at the registrar.
# NOT verifiable by machine (always answer 200/403): Instagram, TikTok -> check the link by hand.
# "free" = RDAP 404 plus an explicit whois "no match"; any error is "?". For handles, "free" means no
# public profile was found, not that the handle can be claimed: confirm on the platform.
# "free" means not registered / no account. A free domain can still be a premium price: check at the registrar.

set -uo pipefail

TLDS=(com ai app io co)
UA="Mozilla/5.0 (name-check)"

code() { curl -s -o /dev/null -w '%{http_code}' -L --max-time 10 -A "$UA" "$1"; }

domain() { # RDAP first; rdap.org answers 404 for some TLDs it does not serve, so confirm with whois
  local d=$1 c w
  c=$(code "https://rdap.org/domain/$d")
  [ "$c" = 200 ] && { echo "taken"; return; }
  [ "$c" = 404 ] || { echo "?"; return; }    # RDAP error or timeout: unknown, never free
  w=$(whois -- "$d" 2>/dev/null) || { echo "?"; return; }
  if printf '%s' "$w" | grep -qiE '^ *Domain Name: *[a-z0-9]'; then echo "taken"
  elif printf '%s' "$w" | grep -qiE '^ *(no match for|not found|domain not found|no data found|the queried object does not exist)'; then echo "free"
  else echo "?"; fi
}

mark() { # http code -> free / taken / ?
  case "$1" in
    404) echo "free" ;;
    200) echo "taken" ;;
    *)   echo "? ($1)" ;;
  esac
}

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  sed -n "2,10p" "$0"; exit $([ $# -eq 0 ] && echo 1 || echo 0)
fi

printf '| Name |'; for t in "${TLDS[@]}"; do printf ' .%s |' "$t"; done
printf ' GitHub | YouTube | X | Instagram | TikTok | Trademark |\n'
printf '%s' '|---|'; for _ in "${TLDS[@]}"; do printf '%s' '---|'; done; printf '%s\n' '---|---|---|---|---|---|'

for raw in "$@"; do
  n=$(printf '%s' "$raw" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9-')
  n=${n#"${n%%[!-]*}"}; n=${n%"${n##*[!-]}"}   # no leading/trailing hyphen (never a whois option)
  [ -n "$n" ] || { echo "skipped: '$raw' has no letters or digits" >&2; continue; }
  printf '| %s |' "$n"
  for t in "${TLDS[@]}"; do
    printf ' %s |' "$(domain "$n.$t")"
  done
  printf ' %s |' "$(mark "$(code "https://api.github.com/users/$n")")"
  printf ' %s |' "$(mark "$(code "https://www.youtube.com/@$n")")"
  printf ' %s |' "$(mark "$(code "https://x.com/$n")")"
  printf ' [check](https://www.instagram.com/%s/) |' "$n"
  printf ' [check](https://www.tiktok.com/@%s) |' "$n"
  printf ' [USPTO](https://tmsearch.uspto.gov/search/search-results?query=%s) |\n' "$n"
done
