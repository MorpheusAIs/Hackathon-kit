---
name: deck
description: Build the finals presentation from research/synopsis.md and the brand kit in research/design.md, as a Marp markdown deck exported to PDF and PPTX (Marp's PPTX holds slides as images; edit the markdown, not the PPTX). One idea per slide, the demo as the centerpiece, speaker notes with timings. Writes showcase/deck.md, deck.pdf, deck.pptx.
---

# Deck

1. Read `research/synopsis.md` (the story and the close) and `research/design.md` (the look).
2. Write `showcase/deck.md` in Marp format (`marp: true`, a theme block from the brand kit, 16:9).
3. Slide order (adjust to the official time limit):
   1. The one sentence + the product name
   2. The villain: the real buyer quote + $ per month
   3. The first-principles gap: one number
   4. **LIVE DEMO** (a single slide that says "Demo"; the product is the slide)
   5. Proof: the best real numbers, with how they were counted
   6. Why now / why us (built end to end during the event)
   7. The mission: who gains (the buyer, the user, and anyone else in the chain)
   8. One more thing (the held-back surprise)
   9. The close: INVEST ask + REFER QR code and share link
   10. Backup slides: the evidence table, the hook results, the architecture (product → Morpheus gateway or node)
4. Rules: ≤ 15 words per slide; numbers big; every number has its source in the speaker notes; no stock photos of people pretending to be users.
5. Export: `npx @marp-team/marp-cli showcase/deck.md --pdf` and `npx @marp-team/marp-cli showcase/deck.md --pptx`. Add `--allow-local-files` only for local images you made yourself.
6. Gate: the deck plays offline; each slide's speaker note has a timing; total time is under the limit in one timed read-through.
