# Execution graphs

Each event phase is a DAG (directed acyclic graph). Nodes are tasks; edges are dependencies. Every node has an owner, a skill, a timebox and a **gate**: a pass/fail check that must pass before downstream nodes start. `/run-graph` executes a graph. Ready nodes run in parallel as subagents. Nodes with `human_gate: true` stop and wait for a person.

| Graph | Phase | When |
|---|---|---|
| `0-preflight.yaml` | accounts, keys, Morpheus, tooling dry-fire | before build day |
| `1-discover.yaml` | research → pain map → wedge → opportunity (GO / PIVOT / STOP) | build day, first phase |
| `2-build.yaml` | scaffold → POC → MVP → freeze → approved production release | build day, middle; starts only after `opportunity` says GO |
| `3-ship.yaml` | site, demand test, outreach | build day, in parallel with MVP |
| `5-showcase.yaml` | **post-ship:** retro → synopsis → design → deck + DR ads + video prompt → honesty review → approver sign-off | when the `demo` tag exists |
| `4-pitch.yaml` | script, drill, rehearsal, final approval (uses the deck) | after 5-showcase, before judging |

`1-discover.yaml` ends with the `opportunity` node (`/opportunity`, output `research/opportunity.md`). It rates four risks with evidence and returns GO, PIVOT or STOP. `2-build.yaml` starts only after a GO.

Node schema:
```yaml
- id: string            # unique
  owner: builder | researcher | agent | approver
  skill: /name           # or "manual"
  needs: [ids]           # edges
  out: path              # artifact
  gate: "command or checkable condition"
  timebox_min: int
  human_gate: bool       # stop for approval (anything outward, money, or irreversible)
```
Rule: if a gate fails twice, escalate (a stronger model, another team member, or cut scope). Never loop a third time.
