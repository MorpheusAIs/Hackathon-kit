# Changelog

## v0.2 (2026-10-27)
- New skill `/name`: brief from the lead hook, 30 candidates in six naming styles, kill filters, availability check, scored shortlist, 5-second test, lock. Added `tools/check-name.sh` (domains via RDAP and whois, GitHub, YouTube, X; Instagram, TikTok and trademark by hand).
- `/name` wired into `graphs/3-ship.yaml`: `hooks` (`research/hooks.md`) -> `name` (`research/name.md`) -> `site`. **Schedule change:** `site` now waits for `hooks` and `name` and is a human gate (before, it could start at once). The new manual `hooks` node writes `research/hooks.md`; `/ship-site` no longer writes it and tests those hooks instead. `/ship-site` reads `research/name.md`; `/pitch` reads `research/name.md` and `research/poc-runs/`.
- New `tools/kit-lint.sh`: checks skill and graph references, node layout, duplicate ids, `needs`, output paths (each node against its own skill), shared output paths, `Output` and `Done when` headings, and placeholders.
- Every skill now has an `Output` section and a `Done when` checklist, with output templates for `gtm-wedge`, `pitch`, `poc` and `ship-site`.
- Path alignment: the signed pick goes to `research/pick.md` (`/gtm-wedge` reads it); `drill` writes `research/pitch-drill.md`; `rehearse` writes `research/pitch-rehearsal.md`; `send` writes `research/outreach-approved.md`; `/market-scan` writes to the path the graph node gives; `poc` also lists `research/poc.md`; the MVP is hardened in `app/`.
- `/run-graph` runs ready nodes one at a time when the agent cannot run subagents. `/market-scan` and `/scaffold` have fallbacks when `last30days` or gitleaks is missing.
- Harness-neutral layout: `AGENTS.md` is canonical (now also lists the skills and tools); `CLAUDE.md` imports it with `@AGENTS.md`.

## v0.1
- Initial public release: Morpheus gateway setup, examples, discovery-first skills and execution graphs.
