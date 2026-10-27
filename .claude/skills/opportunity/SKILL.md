---
name: opportunity
description: Discovery gate before building. Rate the four product risks (value, usability, feasibility, viability) with evidence, name the value (economic or otherwise) and the cost of inaction, and return GO / PIVOT / STOP. Reads research/pain-map.md and research/gtm.md. Writes research/opportunity.md. Run after /gtm-wedge and before /scaffold.
---

# Opportunity assessment (the discovery gate)

This follows the product-discovery approach in Marty Cagan's *Inspired*. Read `DISCOVERY.md` first.

## Step 1: Answer the assessment (one or two lines each, each with a source)
1. **Problem:** exactly what problem does this solve, in the buyer's words?
2. **For whom:** the first buyer (from the ICP in `research/gtm.md`).
3. **Cost of inaction:** what the buyer loses each month if nothing changes. State the unit (dollars, hours, risk, harm).
4. **Value:** what the buyer gains. Is it economic or not (time, safety, access, trust)? How would you measure it in a week?
5. **Size:** TAM, SAM and SOM from `research/scan-*.md`, with the bottom-up math (buyers × annual spend on the workaround). Label them as estimates.
6. **Competition:** direct competitors, indirect ones and substitutes (including "nothing"), from the scan's competitor matrix, and why each falls short.
7. **Why us, why now:** what lets this team build it now (for example, inference that was too expensive or too closed before).
8. **Go to market:** how the first 10 buyers find it.
9. **Success metric:** the one number that would show it works.
10. **Viability:** who pays, the price, the Morpheus inference cost per use (run one representative product request, read the token `usage` in the response, and multiply by the [pricing page](https://apidocs.mor.org/documentation/models/pricing.md)), and who keeps it running after the event.

## Step 2: Rate the four risks
| Risk | Rating (low / medium / high) | Evidence | Cheapest test still to run |
|---|---|---|---|
| Value: will they choose it? | | | |
| Usability: can they use it unaided? | | | |
| Feasibility: can we build it in time on Morpheus? | | | |
| Viability: does the money or effort hold up? | | | |

## Step 3: The verdict
- **GO:** no risk is rated high, or the one high risk has a test that runs on build day. Write the riskiest assumption and its test at the top of `research/poc.md`.
- **PIVOT:** value or viability is high risk with no quick test. Return to the runner-up in `research/pain-map.md`.
- **STOP:** the cost of inaction is near zero, or nobody pays and there is no other measurable value.

## Output: `research/opportunity.md`
The 10 answers, the risk table, the verdict, and one line on what would change the verdict.

Gate: every answer cites `research/` or a URL; all four risks have a rating and evidence; the verdict is GO, PIVOT or STOP.
