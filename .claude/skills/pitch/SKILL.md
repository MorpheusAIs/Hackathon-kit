---
name: pitch
description: Write the 3-minute pitch and demo script plus a judge Q&A drill, from the research files and the live product. Use after the product ships and before judging, then rehearse.
---

# Pitch

Read `research/synopsis.md` first if it exists (it holds the story and the close), then `research/pain-map.md`, `research/gtm.md`, `research/name.md`, `research/funnel.md`, the run logs in `research/poc-runs/` and the live site's numbers.

## Script, 3 minutes (adjust to the pitch time limit in CLAUDE.md)
1. **0:00–0:20 Hook:** one real quote from a real buyer, then "<N> businesses like this lose <$/time> to it."
2. **0:20–0:40 Who and why now:** the ICP sentence, and why AI makes it possible now.
3. **0:40–2:00 Live demo:** one flow end to end. Narrate the outcome, not the tech. Keep the backup recording queued.
4. **2:00–2:30 Proof:** signups or clicks since launch, the conversations you had, and the price.
5. **2:30–2:50 Theme:** the link to the event's theme, from CLAUDE.md. One sentence, backed by something visible in the demo.
6. **2:50–3:00 Ask:** what you want (pilot users, intros, and so on). Then stop talking.

## Judge Q&A drill
Write the 10 hardest questions this room will ask (business model, competition, why you, scale, the moat, "is this just a GPT wrapper"), each with a 2-sentence answer. Then quiz the team: ask each question cold and score each answer.

## Output: `research/pitch.md`
The script with timings, plus the Q&A. Rehearse it out loud 3 times with a timer.
```
# Pitch: <name from research/name.md>
## Script (timed)
| Time | Beat | Words |
## Demo notes (flow, backup recording, "Faked for demo")
## Judge Q&A (10)
1. Q: ... / A: (2 sentences)
## Rehearsal log: kept in `research/pitch-rehearsal.md` by the `rehearse` node
```

## Done when
- The timed script fits the pitch time limit at speaking pace (about 130 words a minute). The three human run-throughs happen later, in the `rehearse` node.
- 10 judge questions each have an answer of two sentences.
- Every number on stage traces to `research/` or the live site.
