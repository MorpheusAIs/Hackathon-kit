---
name: market-scan
description: Evidence-first market scan of one problem space — who hurts, how big the market is (TAM / SAM / SOM), what they pay today, who competes (direct, indirect, substitutes), whether a community is discussing the pain, and why now. Use at the start of the hackathon for each candidate space. Arg = the space, e.g. "independent HVAC contractors".
---

# Market scan

Goal: in at most 60 minutes, find out whether this space has a painful, paid-for problem, in a market big enough to matter, that an AI product could fix in one day of building.

## Step 0: Frame (optional idea patterns)
Restate the space as "<buyer> trying to <job>". If the arg is vague, pick the sharpest reading and say which one you picked. If you have no space yet, start from a proven AI-agent business pattern and find a buyer for it:

| Pattern | What the agent does |
|---|---|
| Quote finder | Collects quotes from many suppliers for a buyer and compares them |
| Outreach machine | Finds businesses with a visible gap, audits them, drafts a personal fix |
| Small-site builder | Builds a cheap, fast site for businesses that have none or a bad one |
| Marketplace reseller | Finds under-priced listings and relists or matches them |
| Agentic storefront | Runs sourcing, listing and customer replies for a small online shop |
| Agents talking to agents | Negotiates, books or qualifies by talking to another business's agent |

## Step 1: Search wide (12–20 searches, in parallel where possible)
- **Complaints:** `"<buyer>" (hate OR frustrating OR "waste of time") <job>`, plus Reddit, forums and Discord/Slack communities.
- **Reviews in bands:** 1–2★ (the pain), 2–3★ (mixed: what almost works), 4–5★ (counter-evidence). Sources: G2, Capterra, app stores, Trustpilot, Google reviews.
- **Spend and willingness to pay:** pricing pages; Upwork and Fiverr gigs where people pay a human for the workaround; job posts for the manual task; public feature-request boards; government spend data where relevant.
- **Competitors:** direct competitors, indirect ones (adjacent tools used for this job), and substitutes (spreadsheets, an assistant, "nothing"). Check their changelogs and review "dislikes".
- **Size:** count of buyers (BLS, Census, trade associations, industry reports) and the typical annual spend per buyer on the workaround.
- **Community:** where the buyers talk about this pain, how many people, and how recently.
- **Why now:** what changed recently (cost of AI, a regulation, a platform shift, a price rise by an incumbent).
- If the `last30days` skill is installed, run it on the space for current chatter.

## Step 2: Quote, don't summarize
Keep 8–15 verbatim pain quotes, each with its URL, date and the speaker's role. Count independent people, not posts.

## Step 3: Size the market (bottom-up, labelled as an estimate)
| Layer | Definition | Math | Source |
|---|---|---|---|
| **TAM** | Every buyer with this problem | number of buyers × annual spend on today's workaround | |
| **SAM** | The segment your product can serve (region, size, channel you can reach) | TAM × share that fits | |
| **SOM** | What you can realistically win in year one | SAM × a conservative win rate, with the reason | |

Bottom-up beats top-down: a report's "$40B market" is context, not your TAM. Show the math so a judge can check it.

## Output: `research/scan-<slug>.md`
```
# Scan: <buyer> trying to <job>
## Verdict: SUPPORTED / CONTRADICTED / INSUFFICIENT: one line why (a hypothesis screen, never "validated")
## Pain quotes (verbatim, sourced)
- "<quote>" — <role>, <date>, <url>
## Community signal
| Where | Size | Most recent thread | Link |
## What they pay today (willingness to pay)
| Tool / service / human workaround | Price | Complaint |
## Market size (estimate)
| TAM | SAM | SOM | math + sources |
## Competitor matrix
| Competitor | Type (direct / indirect / substitute) | Price | Positioning | Weakest point (from reviews) | Switching cost |
## Why now
## One-day AI wedge ideas (2–3)
## Unknowns
```

## Gates
- **Community gate:** if you find no community where buyers discuss this pain in the last 12 months, the verdict cannot be SUPPORTED.
- **Evidence gate:** no claim without a URL whose page you checked contains the quote.
- If evidence is thin after 60 minutes, say INSUFFICIENT, list which sources failed or returned nothing, and move on. Thin evidence is not proof that demand is absent.
