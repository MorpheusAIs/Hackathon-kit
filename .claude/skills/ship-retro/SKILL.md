---
name: ship-retro
description: Start of the post-ship graph. When the team says "we're done and shipped", collect what was built, what happened, the data and the pain points from every source (repo, research files, funnel, approvals, git history, team members' own notes), and write one sourced fact base. Writes research/retro.md. Use as node "retro" in graphs/5-showcase.yaml.
---

# Ship retro: one fact base

## Trigger
The `demo` tag exists and the product is live (`research/release.md` holds the production URL). Do not start before that.

## Collect (in parallel where possible)
| Source | What to take |
|---|---|
| `git log`, tags, merged pull requests | What was built and when; the `demo` tag and deploy ID |
| `research/scan-*.md`, `pain-map.md`, `gtm.md`, `opportunity.md` | Pains with quotes, counts, $ per month, ICP, wedge, price |
| `research/funnel.md`, form export (counts only) | Views, clicks, signups by hook and channel; room signups separate; test signups excluded |
| `research/hooks.md` (if present), ad reports | Hook results (or "insufficient evidence") |
| `research/feedback.md` (if present), mentor notes, user quotes (consented) | What people said about the product |
| `research/approvals.md`, `research/board.md` | What went out, and how the graphs ran (times, failed gates) |
| Each member's own notes | Each member answers from their own notes: "What did we build, what surprised us, what would we change?" and pastes the answer into `research/retro-inputs/<member>.md`. Nobody connects private notes to this repo |

## Output: `research/retro.md`
```
What we built (one paragraph + the live URL)
Timeline (build day → judging)
The pain (top 3, each with quote + source + count + $/month)
The buyer (ICP) and the wedge
The evidence (hypothesis screen; supported / contradicted / insufficient)
Traction (exact counts, with the date and time; how counted)
What users and mentors said (consented quotes)
What failed and what we changed
Open questions
```
Rules: every line has a source path or URL. No number without its count method. Mark anything unverified as UNVERIFIED.
