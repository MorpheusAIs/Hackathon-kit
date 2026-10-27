---
name: market-scan
description: Fast evidence-first market scan of one problem space — who hurts, what they pay today, who already sells into it, and what people are saying in the last 30 days. Use at the start of the hackathon for each candidate space. Arg = the space, e.g. "independent HVAC contractors".
---

# Market scan

Goal: in at most 45 minutes, find out whether this space has a painful, paid-for problem that an AI product could fix in one day of building.

## Steps
1. **Restate the space** as "<buyer> trying to <job>". If the arg is vague, pick the sharpest reading and say which one you picked.
2. **Search wide, 8–12 searches**, run in parallel where possible:
   - Complaints: `"<buyer>" (hate OR frustrating OR "waste of time") <job>`, plus Reddit and forum threads.
   - Spend: what tools or services they pay for today, and the prices (pricing pages, G2/Capterra).
   - Incumbents: 3–5 competitors and their weakest reviews (1–2 star reviews are the gold).
   - Size: count of businesses or workers (BLS, Census, trade associations). An order of magnitude is enough.
   - If the `last30days` skill is installed, run it on the space for current chatter.
3. **Quote, don't summarize.** Keep 8–15 verbatim pain quotes, each with its URL and the speaker's role.

## Output: `research/scan-<slug>.md`
```
# Scan: <buyer> trying to <job>
## Verdict: SUPPORTED / CONTRADICTED / INSUFFICIENT: one line why (a hypothesis screen, never "validated")
## Pain quotes (verbatim, sourced)
- "<quote>" — <role>, <url>
## What they pay today
| Tool/service | Price | Complaint |
## Incumbents and their gaps
| Competitor | What it does | Weakest point (from reviews) |
## Size (rough)
## One-day AI wedge ideas (2–3)
## Unknowns
```

Rules: no claim without a URL whose page you checked contains the quote. If evidence is thin after 45 minutes, say INSUFFICIENT, list which sources failed or returned nothing, and move on. Thin evidence is not proof that demand is absent.
