---
name: synopsis
description: Build the presentation synopsis for the finals — one sentence, villain, three beats, the demo moment, the "one more thing", proof, and a two-part close that makes judges want to INVEST and the room want to REFER. Tailors to the actual panel. Reads research/*.md and live funnel numbers; writes research/synopsis.md. Run before /pitch.
---

# Synopsis: make them want to invest and refer

Input: `research/pain-map.md`, `research/gtm.md`, `research/funnel.md`, `research/hooks.md` (if present), `research/retro.md`, the live product. Output: `research/synopsis.md`, which `/pitch` turns into the timed script.

## Rules
1. Only true, sourced claims. Label the evidence "a hypothesis screen from public signals". A judge who catches one overclaim stops believing everything else.
2. The demo is the hero. Slides support the demo; they do not replace it.
3. Be plain and authentic. You built this yourselves; that is a strength. Do not imitate anyone's voice.

## Step 1: The panel map (15 min)
For each judge (names from the event materials), use public bios only:
| Judge | What they back or build | What they will ask | The line in our pitch that is for them |
Room context: who is in the room, what they reward, and the event's theme, from CLAUDE.md.

## Step 2: The core, from strong presenters
| Technique | Why it works | Write it |
|---|---|---|
| **One sentence** a judge can repeat to someone else | A judge who can repeat it can sell it | "[Product] helps [named buyer] [outcome] without [pain]." ≤12 words |
| **Villain and hero** | Stakes make the product matter | The villain is the broken status quo, not a competitor. Name what it costs, in dollars per month |
| **First-principles cost breakdown** | One number makes the gap concrete | Why it costs this much today, what it should cost, and why AI now closes the gap. One number |
| **Rule of three** | Three ideas are remembered; five are not | Three benefits, no more |
| **What is → what could be** | Contrast creates momentum | Alternate the painful now and the better future, 2–3 times |
| **Show, don't tell** | The demo is the proof | One live flow, narrated as the outcome for the buyer, not the tech |
| **A held-back surprise** | A memorable ending | One surprise saved for the end: e.g. the signup counter moving live, or switching the AI between models on stage |
| **Traction first, then the ask** | YC Demo Day style (optional) | The best real number in the first 30 seconds |
| **The mission** | Shows where this goes | One sentence on where this goes if it works. Who gains: the buyer, the user, and anyone else in the chain |

## Step 3: The close, in two parts
- **INVEST:** what you want (pilot users, intros, a mentor, a follow-up meeting), plus one reason it's a good bet: the evidence, the cost gap, or the team's speed (built end to end during the event).
- **REFER:** "Who is one person you know who [has this exact pain]?" Show a QR code to a **shareable link** with a one-line message they can forward. Make sending it take 10 seconds. A referral is the strongest proof that the room believes it.

## Step 4: Pre-empt the hard questions
The top 5 objections this panel will raise ("is this just a ChatGPT wrapper?", "who pays?", "why you?", "what stops a big company?", "how big is this?"). Give a 2-sentence answer each, backed by evidence. Put the strongest answer **inside** the pitch, before anyone asks.

## Output: `research/synopsis.md`
```
One sentence:
Villain (+ $/month):
First-principles gap (one number):
Three benefits:
Demo moment (the flow, the outcome narrated):
One more thing:
Best real number (first 30 s):
Mission (who gains):
Close: INVEST ask · REFER ask + share link + QR
Panel map (per judge line):
Top 5 objections + answers:
30-second hallway version:
What we will NOT claim:
```
## Done when
- A person outside the team reads only the one sentence, then says back what the product does and who it is for. If they can't, rewrite the sentence.
- The close has both an INVEST ask and a REFER ask.
- The top 5 objections each have a 2-sentence, evidence-backed answer.
