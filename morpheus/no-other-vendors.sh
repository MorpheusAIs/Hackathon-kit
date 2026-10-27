#!/usr/bin/env bash
# Limited STATIC check (pre-commit / CI): fails if tracked or untracked source files reference an AI vendor
# endpoint or key name other than Morpheus. It does not prove runtime routing; preflight + the call log do that.
set -uo pipefail
pat='api\.openai\.com|api\.anthropic\.com|generativelanguage\.googleapis\.com|aiplatform\.googleapis\.com|api\.x\.ai|api\.venice\.ai|openrouter\.ai|api\.together\.xyz|api\.groq\.com|api\.mistral\.ai|OPENAI_API_KEY|ANTHROPIC_API_KEY|GEMINI_API_KEY|XAI_API_KEY'
out=$(git grep -nIE --untracked "$pat" -- ':!morpheus/no-other-vendors.sh' ':!*.md' 2>&1); rc=$?
if [ $rc -eq 0 ]; then printf '%s\n' "$out" | cut -d: -f1,2; echo "FAIL: direct AI-vendor reference found. Route through llm() -> api.mor.org."; exit 1; fi
if [ $rc -ne 1 ]; then printf '%s\n' "$out"; echo "FAIL: scanner error (fail closed)."; exit 2; fi
# Runtime config: the base URL may be api.mor.org or your own node's proxy (morpheus/NODE.md), never another AI vendor.
if [ -f .env ] && grep -E '^(export +)?(MORPHEUS_BASE_URL|OPENAI_BASE_URL)=' .env | grep -qE "$pat"; then
  echo "FAIL: .env base URL points at another AI vendor."; exit 1; fi
echo "PASS (static check only): no direct AI-vendor references."
