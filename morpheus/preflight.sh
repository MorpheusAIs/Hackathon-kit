#!/usr/bin/env bash
# Morpheus preflight: key works, chosen models answer, latency, tool calling.
# Usage: MORPHEUS_API_KEY=sk-... ./preflight.sh "glm-5.3-flash" "Claude Sonnet 5.5"
set -euo pipefail
BASE="${MORPHEUS_BASE_URL:-https://api.mor.org/api/v1}"
: "${MORPHEUS_API_KEY:?set MORPHEUS_API_KEY}"
[ $# -gt 0 ] || { echo "pass model ids (see: curl -s $BASE/models)"; exit 2; }
echo "models listed: $(curl -s -m 20 "$BASE/models" -K <(printf 'header = "Authorization: Bearer %s"\n' "$MORPHEUS_API_KEY") | python3 -c 'import json,sys;print(len(json.load(sys.stdin)["data"]))')"
fail=0
for m in "$@"; do
  body=$(python3 -c 'import json,sys;print(json.dumps({"model":sys.argv[1],"max_tokens":20,"messages":[{"role":"user","content":"Reply with the word OK."}]}))' "$m")
  t0=$(python3 -c 'import time;print(time.time())')
  out=$(curl -s -m 90 "$BASE/chat/completions" -K <(printf 'header = "Authorization: Bearer %s"\n' "$MORPHEUS_API_KEY") -H 'Content-Type: application/json' -d "$body" || true)
  dt=$(python3 -c "import time;print(round(time.time()-$t0,1))")
  txt=$(printf '%s' "$out" | python3 -c 'import json,sys
try: print(json.load(sys.stdin)["choices"][0]["message"]["content"][:40].replace("\n"," "))
except Exception: print("ERROR")')
  tool=$(curl -s -m 90 "$BASE/chat/completions" -K <(printf 'header = "Authorization: Bearer %s"\n' "$MORPHEUS_API_KEY") -H 'Content-Type: application/json' -d "$(python3 -c 'import json,sys;print(json.dumps({"model":sys.argv[1],"max_tokens":200,"messages":[{"role":"user","content":"What is the weather in Paris? Use the tool."}],"tools":[{"type":"function","function":{"name":"get_weather","parameters":{"type":"object","properties":{"city":{"type":"string"}},"required":["city"]}}}]}))' "$m")" | python3 -c 'import json,sys
try: print("yes" if json.load(sys.stdin)["choices"][0]["message"].get("tool_calls") else "no")
except Exception: print("ERROR")' || echo ERROR)
  printf '%-28s %6ss  reply=%-12s tools=%s\n' "$m" "$dt" "$txt" "$tool"
  [ "$txt" = "ERROR" ] && fail=1
  [ "$tool" = "yes" ] || echo "  note: $m has no working tool calls (OK for plain-text JSON use; not OK as a tool-calling demo model)"
done
echo "Saved evidence: rerun with | tee research/preflight-$(date +%F).txt"
exit $fail
