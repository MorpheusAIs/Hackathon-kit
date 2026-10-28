---
name: ship-site
description: Generate and deploy a one-page landing site for the product with an honest notify-me signup, behind an approver gate, and analytics, in under an hour. Reads research/gtm.md and research/name.md. Use on build day once the wedge is set.
---

# Ship site

1. Read `research/gtm.md` and `research/name.md` (product name, domain). The copy comes from them. Do not invent new claims.
2. Build a single static page (`site/index.html`, plain HTML plus a small CSS block, no framework unless the product already uses one):
   - **Hero:** the pain in the buyer's words, then the outcome. One line each.
   - **How it works:** 3 steps, plus a screenshot or GIF of the real demo.
   - **Price:** the number from gtm.md.
   - **Call to action:** a waitlist form (Tally embed or a Formspree POST), or an honest "Notify me at launch" signup. **No payment capture and no fake buy buttons**; state the planned price as text. Add a one-line privacy note on what is collected.
   - **Footer:** the project or team name (no personal names), a contact email, and nothing else.
   - Mobile-first, fast, no stock-photo filler.
3. Add analytics: Vercel Analytics, or the Plausible script.
4. **Approval gate (always, even if this skill is run on its own):** deploy a *preview* first (`cd site && vercel`). Show the approver named in CLAUDE.md the rendered preview URL, the destination domain, what data the form collects and where it goes, and any spend. Wait for an explicit yes.
5. Only after that yes: `vercel --prod`. Print the live URL. Any later edit to copy or data collection needs a fresh yes.
6. Verify on the live URL: the page loads on a phone viewport, the form submits, and the click is recorded. Show the evidence.
7. Write the URL and the call-to-action target number below the title of `research/gtm.md`.
8. Test the hooks in `research/hooks.md` (written before `/name`; one per `?h=` variant or UTM link, in the buyer's words from the research). Record views, clicks and signups by hook and channel, with the time counted, in `research/funnel.md`. Exclude team and test signups.

## Output
`site/index.html` (live URL), and the URL plus target number below the title of `research/gtm.md`. Funnel counts go to `research/funnel.md`.
```
<!-- below the title of research/gtm.md -->
Site: <live URL> | Target: <N signups by judging> | Counted via: <analytics/form>
```

## Done when
- The approver approved the preview before `vercel --prod`.
- The live URL loads on a phone viewport, the form submits, and the click is recorded.
- No payment capture; planned price shown as text only.

Rules: no secrets in client-side code. If the product calls an LLM, the key stays in a serverless function or backend, never in the page.
