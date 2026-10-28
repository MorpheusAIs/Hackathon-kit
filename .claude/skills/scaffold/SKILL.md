---
name: scaffold
description: Generate the project skeleton ON BUILD DAY from this spec (no pre-written product code) — app, Morpheus llm() wrapper with fallback + run log, vendor guard, .gitignore, preview deploy. Target 20 minutes. Use as node "scaffold" in graphs/2-build.yaml.
---

# Scaffold (generated on the day, from spec)

This skill is a specification, not code: it writes the skeleton fresh at the event. Follow your event's rules on pre-existing code. If they are unclear, ask the organizers in writing.

Generate:
1. `app/`: Next.js (App Router, TypeScript) unless `research/poc.md` says the flow needs no UI. In that case, a small Node or Python service instead.
2. `app/lib/llm.ts`: one exported `llm({messages, tools?, model?})`:
   - OpenAI SDK, `baseURL = process.env.MORPHEUS_BASE_URL ?? "https://api.mor.org/api/v1"`, key `MORPHEUS_API_KEY`. That is the Morpheus gateway (api.mor.org), or your own node (morpheus/NODE.md).
   - Model from `MODEL_PRIMARY`; on timeout or 5xx, retry once, then use `MODEL_FALLBACK` (also on Morpheus).
   - Append `{ts, model, latency_ms, ok}` to a run log: `data/runs.jsonl` locally; when deployed, a hosted store or the platform's log stream (serverless file systems are read-only). Metadata only: never log secrets, prompts, outputs or personal data.
3. `app/api/run/route.ts`: a server-side endpoint calling `llm()`. The key never reaches the browser.
4. `.env.example` listing the variable names only. Add `.env` and `.vercel/` to `.gitignore` before the first commit.
5. A pre-commit hook and a CI step running `morpheus/no-other-vendors.sh`, plus gitleaks if installed. If gitleaks is not installed, run `git grep -lIE '(sk-|api[_-]?key|secret|BEGIN [A-Z]+ PRIVATE KEY)'` (file names only, so a matched secret is never printed into agent output), open each listed file yourself, and confirm no `.env` is tracked. This fallback is weaker than gitleaks: it does not scan git history. If a real key was ever committed, rotate it.
6. A minimal page with an input box and an output box that calls `/api/run`, to prove the pipe works.
7. `vercel` preview deploy with Vercel deployment protection on (private preview). Print the URL. Add a rate limit, an input-size cap and a daily spend ceiling to `/api/run`.

## Output
`app/` (with `app/lib/llm.ts`, `app/api/run/route.ts`, `.env.example`, the vendor-guard hook and CI step) and a private preview URL.

## Done when
- The local run returns a Morpheus completion.
- The guard passes and the preview URL loads.
- `git log` shows no `.env`.
