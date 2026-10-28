# Morpheus Hackathon Kit

An open-source (MIT) kit for building a hackathon product that is worth building, on **Morpheus decentralized inference**. Morpheus is an OpenAI-compatible API in front of a peer-to-peer network of model providers. One key and one base URL give you 250+ models, including frontier, open-weight, `:web` search and embedding models.

**Agents:** start at [`llms.txt`](llms.txt). **Humans:** start at [`MORPHEUS.md`](MORPHEUS.md) for every official link.

## Why build on Morpheus

| What you get | Why it matters |
|---|---|
| One key, one OpenAI-compatible base URL, 250+ models from many model families | Swap models with a one-line change. You are not tied to one AI company's API |
| Independent providers compete on an open marketplace | Inference is supplied by many operators, not one host. Anyone can become a provider |
| Pay with card, USDC, or staked MOR | Inference can be funded by stake instead of a card ([stakemor.com](https://stakemor.com)) |
| A TEE provider path with attestation | Build where confidential inference matters; check which providers attest before you claim it ([TEE overview](https://nodedocs.mor.org/concepts/tee-overview.md)) |
| Open-source node software | Run your own consumer node and call the network directly ([`morpheus/NODE.md`](morpheus/NODE.md)) |
| Builder subnets | Keep building after the event and attract MOR stake toward your project |

## Who it's for

| You are | Start here |
|---|---|
| **Building an app or product** | The Inference API: quick start below |
| **Building an agent** | [Morpheus Skill](https://morpheusskill.com), or point your agent at your own node ([agents](MORPHEUS.md#agents)) |
| **Running models or spare API capacity** | [Become a provider](MORPHEUS.md#become-a-provider-supply-side) |
| **Holding or staking MOR** | [Builders and capital](MORPHEUS.md#builders-and-capital-after-the-hackathon) |

## Start with the problem, not the code

A product is incomplete until you have mapped **product-market fit**, the **pain**, and the **cost of not solving it**. Approach the build as delivering value, economic or otherwise, in a form that can last. Before you write product code, answer the four product risks from Marty Cagan's product-discovery approach:

| Risk | Question |
|---|---|
| Value | Will the buyer choose this? |
| Usability | Can they use it without help? |
| Feasibility | Can we build it in time, on Morpheus? |
| Viability | Does it hold up as a business or a sustained effort? |

Read [`DISCOVERY.md`](DISCOVERY.md), then run the skills in order: `/market-scan` → `/pain-map` → `/gtm-wedge` → **`/opportunity`** (GO / PIVOT / STOP) → `/scaffold` → `/poc`, then `/name` and `/ship-site` before the pitch. Two steps between them are human, not skills: the signed pick (`research/pick.md`) before `/gtm-wedge`, and the hooks (`research/hooks.md`) before `/name`. The graphs in `graphs/` include both.

## Quick start (5 minutes)

1. Create an account and an API key at [app.mor.org](https://app.mor.org). Keys start with `sk-`.
2. Copy `.env.example` to `.env`, paste your key, and load it into your shell. Never commit `.env`.
   ```bash
   cp .env.example .env        # then edit .env
   set -a; source .env; set +a
   ```
3. Check your key and pick models:
   ```bash
   ./morpheus/preflight.sh "glm-5.3-flash" "Claude Sonnet 5.5"
   ```
   The script prints latency, a reply check and tool-calling support for each model.
4. Run an example (one chat call and one tool call, with retry and fallback):
   ```bash
   pip install -r examples/python/requirements.txt && python examples/python/main.py
   npm install --prefix examples/node && npm start --prefix examples/node
   ```
   Or open the repo in GitHub Codespaces, with `MORPHEUS_API_KEY` set as a Codespaces secret. Everything installs automatically.
5. Point any OpenAI SDK at `https://api.mor.org/api/v1`.
6. Optional: open any agent CLI in this folder (Claude Code, Codex, Grok, Cursor and others). Rules are in `AGENTS.md`, and `CLAUDE.md` imports it. [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) loads the skills in `.claude/skills/` automatically; any other agent runs `/<name>` by reading `.claude/skills/<name>/SKILL.md`. Fill in the Brief in `CLAUDE.md` first.

### Python
```python
from openai import OpenAI
import os

client = OpenAI(base_url="https://api.mor.org/api/v1", api_key=os.environ["MORPHEUS_API_KEY"])
r = client.chat.completions.create(
    model=os.getenv("MODEL_PRIMARY", "glm-5.3-flash"),
    messages=[{"role": "user", "content": "Say hello from Morpheus."}],
)
print(r.choices[0].message.content)
```

### TypeScript
```ts
import OpenAI from "openai";

const client = new OpenAI({ baseURL: "https://api.mor.org/api/v1", apiKey: process.env.MORPHEUS_API_KEY });
const r = await client.chat.completions.create({
  model: process.env.MODEL_PRIMARY ?? "glm-5.3-flash",
  messages: [{ role: "user", content: "Say hello from Morpheus." }],
});
console.log(r.choices[0].message.content);
```

### curl
```bash
curl -s https://api.mor.org/api/v1/chat/completions \
  -H "Authorization: Bearer $MORPHEUS_API_KEY" -H "Content-Type: application/json" \
  -d '{"model":"glm-5.3-flash","messages":[{"role":"user","content":"Say hello from Morpheus."}]}'
```

List the live models with `curl -s https://api.mor.org/api/v1/models`. Model IDs are case-sensitive and can include spaces.

## Choose a lane

| Lane | Best for | Start here |
|---|---|---|
| **Gateway API** | Most teams. Zero infrastructure | Quick start above, then [`morpheus/SETUP.md`](morpheus/SETUP.md) |
| **Template** | A working app in minutes | Template table in [`MORPHEUS.md`](MORPHEUS.md#templates-and-sdks) |
| **Your own node** | Teams who want to call the network directly, without the gateway | [`morpheus/NODE.md`](morpheus/NODE.md) |

## What is in this repo

| File | Purpose |
|---|---|
| `DISCOVERY.md` | The four risks, the pain / cost-of-inaction / fit maps, and further reading |
| `AGENTS.md` | Canonical rules for people and agents: practice for research, repo, marketing, outreach, safety, and the skill list |
| `CLAUDE.md` | Imports `AGENTS.md`, plus a brief to fill in: event, theme, judging, approver |
| `.claude/skills/` | 17 skills for Claude Code (or any agent that reads skill files): discovery → build → name → ship → pitch. `/name` names the product and checks domains and handles |
| `tools/kit-lint.sh` | Consistency check for skills and graphs (skill↔graph references, node layout and `needs`, output paths, `Output` / `Done when` headings, placeholders). Run it before handing the kit on |
| `tools/check-name.sh` | Domain and social-handle availability table for name candidates (used by `/name`) |
| `CHANGELOG.md` | What changed in each kit version |
| `graphs/` | Execution graphs (DAGs) that chain the skills with gates and approvals. Run with `/run-graph` |
| `examples/` | Runnable Python and Node examples on Morpheus |
| `.devcontainer/` | Open the repo in GitHub Codespaces with everything installed |
| `llms.txt` | Machine-readable index of every Morpheus resource, for agents to sweep |
| `MORPHEUS.md` | Human index: docs, API, templates, agents, nodes, providers, known gaps, community |
| `morpheus/SETUP.md` | Gateway setup: what the API has, what it lacks, how to pick models, how to route coding agents |
| `morpheus/NODE.md` | Run your own consumer node, safely |
| `morpheus/preflight.sh` | Tests a key, models, latency and tool calls |
| `morpheus/no-other-vendors.sh` | Pre-commit / CI check that your code calls no other AI vendor directly |
| `.env.example` | Environment variables the scripts and snippets use |

## Check the kit

Run `bash tools/kit-lint.sh` after editing a skill or a graph. It exits 0 when skills and graphs agree.

## Good practice

1. Put all model calls behind one `llm()` function. Read the model IDs from `.env`, so a model swap is a one-line change.
2. Pick a **fallback model**, also on Morpheus, and test it before demo day.
3. Log the model, the endpoint and the latency of each call, but not the prompts. On stage, that log proves where your inference runs.
4. Thinking models can take more than a minute before the first token. For a live demo, use a fast model.
5. No secrets in git, chat or prompts. Run `morpheus/no-other-vendors.sh` as a pre-commit hook:
   ```bash
   ln -s ../../morpheus/no-other-vendors.sh .git/hooks/pre-commit
   ```

## After the hackathon

Keep building: register a [builder subnet](https://gitbook.mor.org/builders/welcome-morpheus-builders.md) to attract MOR stake to your project, or fund your inference with staked MOR at [stakemor.com](https://stakemor.com). The [known gaps](MORPHEUS.md#known-gaps-good-hackathon-projects) list is a good place to find a project worth continuing.

## Help and contributing

Ask questions in this repo's [Discussions](../../discussions). Report kit bugs as issues. Pull requests are welcome. For the API itself, see the support links in [`MORPHEUS.md`](MORPHEUS.md#community-and-support).

## License

[MIT](LICENSE).
