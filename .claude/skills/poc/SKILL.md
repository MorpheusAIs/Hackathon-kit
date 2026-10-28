---
name: poc
description: Build the smallest working proof of concept for the picked wedge — one flow, end to end, on real inference — then harden it into a demo-safe MVP. Reads research/opportunity.md and research/gtm.md. Use on build day.
---

# Proof of concept to MVP

## Stage 1: POC (target 3 hours)
1. From `research/opportunity.md` and `research/gtm.md`, write the **one flow** as user steps: input → what the agent does → output the buyer cares about. At most 5 steps. Put it at the top of `research/poc.md`.
2. Stack (default; change only with a reason):
   - Next.js app on Vercel, or a single FastAPI/Express service if there's no UI.
   - LLM through an OpenAI-compatible client. All inference goes through Morpheus (`https://api.mor.org/api/v1`, key `MORPHEUS_API_KEY`). The primary and fallback are two different Morpheus models, chosen with `morpheus/preflight.sh`. Route everything through one `llm()` function; `morpheus/no-other-vendors.sh` enforces this. See `morpheus/SETUP.md`.
   - Web or browser actions: plain HTTP plus a search API first. Use browser automation only if the flow can't work without it.
3. Hard-code everything that isn't the flow (one user, one example input). Make the flow work on a real example, not a mock.
4. **Gate:** run it on 3 different real inputs. Save the outputs to `research/poc-runs/`. Use synthetic or sanitized inputs only: no customer names, contacts or private records in committed runs. If 2 of 3 are not useful to the buyer, fix the prompt or the flow before adding anything.

## Stage 2: MVP (target 3 hours)
The MVP lives in `app/` (the scaffold output); harden it there, do not start a second project.
- An input form a stranger can use without you explaining it.
- Errors handled: model timeout → retry once → fall back to the second Morpheus model → show a friendly message.
- Log every run as metadata only: time, model, endpoint, latency, status. Do not log prompts, outputs or personal data. These logs become the proof slide. For demo screenshots, use sample inputs, not real customer data.
- Intent: an honest "notify me" signup. Payment is Stripe test mode only, unless the product is real and the approver approves. A signup is interest, not proof of payment.
- Record a 60-second screen capture of the full flow as the stage backup.

## Output
`research/poc.md` and `research/poc-runs/`.
```
# POC
## Flow (<=5 steps: input -> agent -> output)
## Stack and models (primary, fallback)
## Runs (research/poc-runs/run-1..3: input, output, useful? y/n)
## Faked for demo
```

## Done when
- The flow runs end to end on real inference; 2 of 3 real inputs gave useful output, saved in `research/poc-runs/`.
- MVP (`mvp` node only): a stranger uses it unaided, the fallback model works, and a run log is written.
- "Faked for demo" lists every shortcut.

## Rules
- Keys stay in `.env` and in server-side code only.
- Freeze features at the time set in CLAUDE.md, and only polish after that.
- Write down every shortcut in `research/poc.md` under "Faked for demo", so you never claim it's real when judges ask.
