---
name: run-graph
description: Execute an execution graph (graphs/*.yaml) — topologically order nodes, run every ready node in parallel as a subagent with its skill, check each gate, stop at human gates, and keep a live status board. Arg = graph file, e.g. graphs/1-discover.yaml.
---

# Run graph

1. Load the YAML. Validate it: unique ids, every entry in `needs` exists, no cycles. Report any error and stop.
2. Write `research/board.md` (this orchestrator is its only writer; parallel graph runs append to their own section): a table of node, owner, status (waiting/running/gate-check/blocked/done), start time, elapsed vs timebox, artifact.
3. Loop:
   - **Ready** = every node in `needs` is done.
   - Launch each ready `agent` node as a parallel subagent with its skill, its inputs (the artifacts of its `needs`) and its `out` path. Give each subagent the gate as its done-condition. If your agent or CLI cannot run subagents, run the ready nodes one at a time in the same order; the gates do not change.
   - For `manual`/person nodes, print a one-line ask to that person and wait.
   - When a node returns, run or check its **gate**. Pass → done. Fail → retry once with the failure attached. Second fail → mark blocked and escalate to the humans with a cut-scope proposal.
   - If a node's action is outward (deploy to production, send, post, pay), get the approval **before** running it, not after.
   - A node with `human_gate: true` never auto-passes. Show the exact artifact version, destination and spend to the approver named in CLAUDE.md and wait for an explicit yes from that person. Log it in `research/approvals.md`. Any edit needs a new yes.
   - When a node passes its timebox, warn once at 100% and again at 150%; at 150%, propose shipping what exists.
4. Update `research/board.md` after every state change.
5. At the end, print the actual minutes per node next to each timebox. Feed these back into the graph (the upgrade loop).

Hard rules: nothing outward (email, post, payment) without a human gate; no secrets in any artifact; all AI goes through Morpheus (see morpheus/SETUP.md).

## Output
`research/board.md`, updated after every state change, and a final table of actual minutes per node against each timebox.

## Done when
- Every node in the graph is done, or blocked with an escalation to the humans.
- Every `human_gate` node has an explicit yes logged in `research/approvals.md`.
- `research/board.md` shows the final state and the actual minutes per node.
