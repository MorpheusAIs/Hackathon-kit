# Morpheus Hackathon Kit

Build your hackathon project on **Morpheus decentralized inference**: an OpenAI-compatible API in front of a peer-to-peer network of model providers. One key and one base URL give you 250+ models, including frontier, open-weight, `:web` search and embedding models.

**Agents:** start at [`llms.txt`](llms.txt). **Humans:** start at [`MORPHEUS.md`](MORPHEUS.md) for every official link.

## Quick start (5 minutes)

1. Create an account and an API key at [app.mor.org](https://app.mor.org). Keys start with `sk-`.
2. Copy `.env.example` to `.env` and paste your key. Never commit `.env`.
3. Check your key and pick models:
   ```bash
   export MORPHEUS_API_KEY=sk-...
   ./morpheus/preflight.sh "glm-5.3-flash" "Claude Sonnet 5.5"
   ```
   The script prints latency, a reply check and tool-calling support for each model.
4. Point any OpenAI SDK at `https://api.mor.org/api/v1`.

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
| `llms.txt` | Machine-readable index of every Morpheus resource, for agents to sweep |
| `MORPHEUS.md` | Human index: docs, API, templates, community, data, support |
| `morpheus/SETUP.md` | Gateway setup: what the API has, what it lacks, how to pick models, how to route coding agents |
| `morpheus/NODE.md` | Run your own consumer node, safely |
| `morpheus/preflight.sh` | Tests a key, models, latency and tool calls |
| `morpheus/no-other-vendors.sh` | Pre-commit / CI check that your code calls no other AI vendor directly |
| `.env.example` | Environment variables the scripts and snippets use |

## Good practice

1. Put all model calls behind one `llm()` function. Read the model IDs from `.env`, so a model swap is a one-line change.
2. Pick a **fallback model**, also on Morpheus, and test it before demo day.
3. Log the model, the endpoint and the latency of each call, but not the prompts. On stage, that log proves where your inference runs.
4. Thinking models can take more than a minute before the first token. For a live demo, use a fast model.
5. No secrets in git, chat or prompts. Run `morpheus/no-other-vendors.sh` as a pre-commit hook:
   ```bash
   ln -s ../../morpheus/no-other-vendors.sh .git/hooks/pre-commit
   ```

## Help

Ask questions in this repo's [Discussions](../../discussions). Report kit bugs as issues. For the API itself, see the support links in [`MORPHEUS.md`](MORPHEUS.md#community-and-support).
