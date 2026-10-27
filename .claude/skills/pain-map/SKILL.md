---
name: pain-map
description: Turn the market scans into one scored pain map and pick the problem to build for. Use after /market-scan has run on 1–3 spaces. Reads research/scan-*.md, writes research/pain-map.md.
---

# Pain map

1. Read every `research/scan-*.md`. List each distinct pain once, and merge duplicates.
2. Score each pain 1–5 on six axes, and cite the quote or price behind each score:
   - **Frequency:** how often it bites (daily = 5).
   - **Severity:** money or time lost each time.
   - **Spend now:** they already pay for a workaround (yes, and it's expensive = 5).
   - **Reachable:** you can find and talk to 5 of these people before judging.
   - **Buildable in a day:** an AI flow can visibly fix it in a demo.
   - **Cost of inaction:** what not solving the pain costs per month (money, time, risk, or non-economic harm; say which), cited.
3. Total = product of the six (not the sum), so one zero-ish axis kills a pain.
4. Theme fit is a gate, not a score: drop pains you can't link to the event's theme, from CLAUDE.md, in one sentence.

## Output: `research/pain-map.md`
```
| # | Pain (buyer, in their words) | Freq | Sev | Spend | Reach | Build | Inaction | Total | Evidence |
```
Then:
- **Pick:** the top pain, plus one sentence on why it beats #2.
- **Value type:** economic, or other (time, safety, access, dignity) — name it and how you'd measure it.
- **Riskiest assumption:** the one belief that, if false, kills the pick, and how to test it before judging (5 conversations, a post, a landing-page click test).
- **Runner-up:** the fallback if the test fails early on build day.

Write the pick in the user's words, not ours. If the top two are within 10%, pick the one that is easier to demo.
