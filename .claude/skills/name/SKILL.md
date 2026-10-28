---
name: name
description: Name the product in 30 minutes — brief from the hook, 30 candidates across six naming styles, kill filters, availability check (domains + socials), scored shortlist, a 5-second test, then lock. Reads research/gtm.md and research/hooks.md, writes research/name.md.
---

# Name

A name has one job: make the hook land faster. Run this after the pick and the hooks, before the page. Reads `research/gtm.md` and `research/hooks.md`. Timebox: 30 minutes.

## 1. Brief (3 min)
Write five lines:
- **Does:** what the product does, in 5 words or fewer.
- **For:** the ICP from `research/gtm.md`.
- **Hook:** the lead hook line from `research/hooks.md`. Every name is tested as "**Name** — hook".
- **Feel:** three adjectives (e.g. fast, trusted, plain-spoken).
- **Avoid:** competitor names in the space, and words the room dislikes (crypto jargon, "AI-powered").

## 2. Generate 30 candidates (8 min)
Five per style. Mix styles; the best name often comes from the least obvious one.

| Style | How | Known examples |
|---|---|---|
| Descriptive | Says what it does | QuickBooks, Booking |
| Compound | Two real words joined | Mailchimp, Salesforce, Facebook |
| Evocative / metaphor | An image of the benefit | Stripe, Slack, Amazon |
| Verb-ready | A word you can use as a verb | Zoom, Venmo |
| Altered real word | Dropped or swapped letter | Lyft, Flickr |
| Coined | New word built from roots | Kodak, Spotify |

Rules for generating: say each one out loud; no "AI", "GPT", "-ify", "-ly" endings; no hyphens; no numbers.

## 3. Kill filters (5 min) — one fail kills the name
1. **Radio test:** said once, out loud, a stranger spells it right. (Altered spellings often fail this. Keep one only if the hook is strong.)
2. **Say-on-sight:** read once, a stranger says it right.
3. **Short:** 3 syllables or fewer, 10 letters or fewer.
4. **Distinct:** not close to a competitor in the same space. Search "<name> <category>".
5. **No bad meaning:** check slang (Urban Dictionary) and the local language of the event.
6. **Hook fit:** "Name — hook" reads as one thought, not two.
7. **Theme fit:** an owner, worker or customer would feel it is for them.

Keep the best 8.

## 4. Availability (3 min)
Run: `tools/check-name.sh <n1> <n2> ... <n8>` (plain bash; any shell or agent can run it)

- **Machine-checked:** .com .ai .app .io .co (RDAP, confirmed by whois), GitHub, YouTube, X. Some `whois` clients (macOS among them) return no answer for .app or other TLDs: a `?` means unknown, so check that domain at the registrar.
- **By hand (links in the table):** Instagram, TikTok, USPTO trademark search. The script cannot check these.
- **Domain rule:** .com is best. If .com is taken, accept in this order: `get<name>.com`, `<name>hq.com`, `try<name>.com`, then `<name>.ai` / `<name>.app`. A taken .com with an active business in the same space kills the name.
- **Handle rule:** one handle everywhere. If the plain name is taken on two or more platforms, use `<name>hq` or `get<name>` on all of them.
- "free" means not registered. A free domain can still be priced as premium. Check the price at the registrar before you choose.

## 5. Score the shortlist (3 min)
Score 1–5. Top total wins the shortlist, ties go to hook fit.

| Name | Hook fit | Distinct | Memorable | Spell/say | Available | Protectable | Total |
|---|---|---|---|---|---|---|---|

Protectable: coined and evocative names rank higher; descriptive names are weak trademarks.

## 6. 5-second test (5 min)
Show the top 3, each as "Name — hook", to 5 people who are not on the team (mentors count). Ask one question: "**What do you think this does?**" Record the answers word for word. Pick the name whose answers are closest to the "Does" line. No votes on "which do you like". Liking is not evidence.

## 7. Lock (3 min)
- **The approver** named in `CLAUDE.md` approves the name, the domain and the price before anything is bought or claimed.
- Buy the domain and claim every handle in the same hour, all with the same spelling.
- Write the decision line into `research/name.md`: name, runner-up, domain, handles, date.

## Output: `research/name.md`
Brief, all 30 candidates by style, the filters each killed name failed, the availability table, the score table, the 5-second-test answers (word for word), the decision. Each claim about an existing company cites a URL.

## Done when
- `research/name.md` holds the brief, all 30 candidates, the availability table and the score table.
- The 5-second-test answers are recorded word for word, from 5 people not on the team.
- The decision (name, runner-up, domain, handles, date) is written to `research/name.md`.
- The approver's approval is recorded before any domain is bought or handle claimed.
