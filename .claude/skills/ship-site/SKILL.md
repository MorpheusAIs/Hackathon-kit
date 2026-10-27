---
name: ship-site
description: Generate and deploy a one-page landing site for the product with an honest notify-me signup, behind an approver gate, and analytics, in under an hour. Reads research/gtm.md. Use on build day once the wedge is set.
---

# Ship site

1. Read `research/gtm.md`. The copy comes from it. Do not invent new claims.
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
7. Write the URL and the call-to-action target number at the top of `research/gtm.md`.
8. Write the hooks you test (one per `?h=` variant or UTM link, in the buyer's words from the research) to `research/hooks.md`. Record views, clicks and signups by hook and channel, with the time counted, in `research/funnel.md`. Exclude team and test signups.

Rules: no secrets in client-side code. If the product calls an LLM, the key stays in a serverless function or backend, never in the page.
