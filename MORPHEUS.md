# Morpheus resource index

Every place to learn about or build on Morpheus, in one page. Links checked 2026-10-27. Agents can use [`llms.txt`](llms.txt), which holds the same index in a form they can sweep.

Morpheus docs are spread across four sites. Use this table to pick one:

| Site | Use it for |
|---|---|
| [apidocs.mor.org](https://apidocs.mor.org) | The hosted Inference API: keys, credits, models, SDK integrations |
| [nodedocs.mor.org](https://nodedocs.mor.org) | **The current, canonical node docs:** consumers, prosumers, providers, the proxy-router API, TEE |
| [gitbook.mor.org](https://gitbook.mor.org) | Protocol, tokenomics, smart contracts, builder subnets, proposals (MRCs) |
| [mor.org](https://mor.org) | Project overview, whitepaper, capital, bug bounty |

The legacy `MorpheusAIs/Docs` repo and older doc repos are not maintained. Prefer the sites above.

## Official machine-readable indexes

| Index | Covers |
|---|---|
| [apidocs.mor.org/llms.txt](https://apidocs.mor.org/llms.txt) | Inference API docs, guides, integrations, API reference |
| [nodedocs.mor.org/llms.txt](https://nodedocs.mor.org/llms.txt) · [llms-full.txt](https://nodedocs.mor.org/llms-full.txt) | Node, consumer, provider and TEE docs. Add `.md` to any page URL |
| [nodedocs.mor.org/mcp](https://nodedocs.mor.org/mcp) | Docs search as an MCP server ([discovery](https://nodedocs.mor.org/.well-known/mcp)) |
| [gitbook.mor.org/llms.txt](https://gitbook.mor.org/llms.txt) | Protocol docs. Add `.md` to any page URL |
| [mor.org/llms.txt](https://mor.org/llms.txt) | Main site. Request pages with `Accept: text/markdown` |
| [OpenAPI spec](https://apidocs.mor.org/api-reference/openapi.json) | Inference API schema |

## Inference API (start here)

| Resource | Link |
|---|---|
| Account, API keys, credits | [app.mor.org](https://app.mor.org) |
| Base URL (OpenAI-compatible) | `https://api.mor.org/api/v1` |
| Live model list | [api.mor.org/api/v1/models](https://api.mor.org/api/v1/models) |
| Interactive API docs | [api.mor.org/docs](https://api.mor.org/docs) |
| Quickstart | [apidocs.mor.org/quickstart](https://apidocs.mor.org/quickstart.md) |
| Hosted API overview (node docs) | [nodedocs](https://nodedocs.mor.org/inference-api/overview.md) |
| Credits and billing | [Credits](https://apidocs.mor.org/documentation/getting-started/credits.md) · [Balance endpoint](https://apidocs.mor.org/api-reference/billing/balance.md) · [Usage](https://apidocs.mor.org/api-reference/billing/usage.md) |
| Ways to pay | Card, USDC or staked MOR ([stakemor.com](https://stakemor.com)) |
| Models, pricing, rate limits | [Models](https://apidocs.mor.org/documentation/models.md) · [Pricing](https://apidocs.mor.org/documentation/models/pricing.md) · [Rate limits](https://apidocs.mor.org/documentation/models/rate-limits.md) |
| Tool calling · Vision | [Tool calling](https://apidocs.mor.org/documentation/guides/tool-calling.md) · [Vision](https://apidocs.mor.org/documentation/guides/vision.md) |
| Embeddings · Text to speech | [Embeddings](https://apidocs.mor.org/api-reference/embeddings/create-embeddings.md) · [Speech](https://apidocs.mor.org/api-reference/audio/speech.md) |
| Health | [API health](https://apidocs.mor.org/api-reference/utility/health.md) · [Model health](https://apidocs.mor.org/api-reference/utility/health-models.md) |

## Integrations (official guides)

[OpenAI Python SDK](https://apidocs.mor.org/documentation/integrations/openai-python-sdk.md) · [Vercel AI SDK v5](https://apidocs.mor.org/documentation/integrations/vercel-ai-sdk-integration.md) · [LangChain](https://apidocs.mor.org/documentation/integrations/langchain.md) · [Cursor](https://apidocs.mor.org/documentation/integrations/cursor.md) · [OpenCode](https://apidocs.mor.org/documentation/integrations/opencode.md) · [Eliza](https://apidocs.mor.org/documentation/integrations/eliza.md) · [n8n](https://apidocs.mor.org/documentation/integrations/n8n.md) · [Open WebUI](https://apidocs.mor.org/documentation/integrations/open-web-ui.md) · [Brave Leo](https://apidocs.mor.org/documentation/integrations/brave-leo.md)

## Templates and SDKs

Gallery: [mor.org/templates](https://mor.org/templates). The source is in the [MorpheusAIs GitHub org](https://github.com/MorpheusAIs). All five agent templates read a Morpheus API key. Most were last pushed in April 2026 or earlier, so pin your dependencies and test before demo day.

| Repo | What it is | Last push |
|---|---|---|
| [morpheus-chatbot](https://github.com/MorpheusAIs/morpheus-chatbot) | Next.js AI chatbot (GitHub template) | 2026-04 |
| [morpheus-coding-agent](https://github.com/MorpheusAIs/morpheus-coding-agent) | Multi-agent coding platform (GitHub template) | 2026-04 |
| [morpheus-open-agents](https://github.com/MorpheusAIs/morpheus-open-agents) · [open-agents.dev](https://open-agents.dev) | Cloud-agent template | 2026-04 |
| [morpheus-knowledge-agent](https://github.com/MorpheusAIs/morpheus-knowledge-agent) | Knowledge-base agent template | 2026-04 |
| [morpheus-community-agent](https://github.com/MorpheusAIs/morpheus-community-agent) | Slack community bot with an admin panel | 2026-04 |
| [x402-playground](https://github.com/MorpheusAIs/x402-playground) | Chat app that calls x402-paid APIs and MCP servers | 2025-10 |
| [api-gateway-typescript-sdk](https://github.com/MorpheusAIs/api-gateway-typescript-sdk) | TypeScript SDK for the gateway | 2025-12 |
| [create-morpheus-template](https://github.com/MorpheusAIs/create-morpheus-template) | CLI scaffold: Next.js + Web3 frontend | 2025-07 |

## Agents

| Resource | What it is |
|---|---|
| [Morpheus Skill](https://morpheusskill.com) | Drop-in skill pack that gives agent frameworks (Hermes, OpenClaw and others) Morpheus inference |
| [installopenclaw.xyz](https://installopenclaw.xyz) | Hosted OpenClaw agent on Morpheus inference, for non-technical users |
| [Gateway for agents (C-Node)](https://nodedocs.mor.org/prosumers/gateway-for-everclaw.md) · [Running local agents](https://nodedocs.mor.org/prosumers/running-local-agents.md) | Point agents at your own consumer node |
| [Agent integration (GitBook)](https://gitbook.mor.org/builders/agent-integration.md) | Agent Forge and MySuperAgent |

## Run a node (consumer or prosumer)

| Resource | Link |
|---|---|
| Introduction: which path to follow | [nodedocs](https://nodedocs.mor.org/get-started/introduction.md) |
| Consumer quickstart (desktop app, 5 min) | [nodedocs](https://nodedocs.mor.org/get-started/quickstart-consumer.md) |
| Consumer node as a daemon (C-Node) | [nodedocs](https://nodedocs.mor.org/prosumers/c-node-setup.md) |
| Open a session · Chat, audio, embeddings | [Buy a bid](https://nodedocs.mor.org/consumers/buy-bid.md) · [Chat](https://nodedocs.mor.org/consumers/chat.md) |
| Sessions: stake, close, claim | [nodedocs](https://nodedocs.mor.org/concepts/sessions-stake-close-recover.md) |
| Networks, chain IDs, token addresses | [nodedocs](https://nodedocs.mor.org/get-started/networks-and-tokens.md) |
| Tokens and fees | [nodedocs](https://nodedocs.mor.org/concepts/tokens-and-fees.md) |
| Troubleshooting | [nodedocs](https://nodedocs.mor.org/consumers/troubleshooting.md) |
| Node software and releases | [Morpheus-Lumerin-Node](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node) · [Releases](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node/releases) |
| This kit's safety checklist | [`morpheus/NODE.md`](morpheus/NODE.md) |

## Live network data

| Resource | What it shows |
|---|---|
| [active.mor.org](https://active.mor.org) · [about](https://nodedocs.mor.org/ecosystem/active-status.md) | Marketplace snapshot, refreshed about every 5 minutes: models, bids, providers (JSON for apps) |
| [active.mor.org/status](https://active.mor.org/status) | Per-bid health checks |
| [tech.mor.org](https://tech.mor.org) | Calculators |
| [dashboard.mor.org](https://dashboard.mor.org) | Capital and builder staking dashboard |

## Become a provider (supply side)

| Path | What you need | Start here |
|---|---|---|
| **Resale provider** (no GPU) | An upstream OpenAI-compatible API you may legally resell | [Overview](https://nodedocs.mor.org/providers/resale/overview.md) · [Pricing a bid](https://nodedocs.mor.org/providers/resale/registering-bid.md) |
| **Full provider** | Your own model behind an OpenAI-compatible endpoint | [Provider quickstart](https://nodedocs.mor.org/get-started/quickstart-provider.md) · [Full P-Node](https://nodedocs.mor.org/providers/full/quickstart.md) |
| **TEE provider** | A confidential VM | [SecretVM quickstart](https://nodedocs.mor.org/providers/full/secretvm-quickstart.md) · [TEE overview](https://nodedocs.mor.org/concepts/tee-overview.md) |
| **Register and bid** | A wallet on Base | [MyProvider](https://myprovider.mor.org) · [Guide](https://nodedocs.mor.org/providers/full/myprovider-gui.md) |

Know these before you start:
- You need MOR (for the provider stake and the per-bid fee) and ETH on Base for gas before you earn anything.
- Bids are priced per second in MOR, not per token. Use the [pricing guide](https://nodedocs.mor.org/providers/resale/registering-bid.md) to convert.
- Read the [rewards doc](https://nodedocs.mor.org/concepts/rewards-and-economics.md) for the current payout and lock rules.
- Many upstream APIs forbid resale. Read their terms first.
- Docker, Akash and AWS hosting guides are in the [nodedocs index](https://nodedocs.mor.org/llms.txt). Before you put secrets on any host, check its current security advisories.

## Builders and capital (after the hackathon)

| Resource | Link |
|---|---|
| Builder welcome | [GitBook](https://gitbook.mor.org/builders/welcome-morpheus-builders.md) |
| Register a builder subnet (stake MOR toward your project, earn builder emissions) | [Setup](https://gitbook.mor.org/builders/builder-subnet-setup.md) · [Emissions](https://gitbook.mor.org/builders/builder-subnet-emissions.md) · [dashboard.mor.org/builders](https://dashboard.mor.org/builders) |
| Builders API | [GitBook](https://gitbook.mor.org/builders/morpheus-builders-api.md) |
| Builders FAQ | [GitBook](https://gitbook.mor.org/faqs/builders.md) |
| Fund inference with staked MOR | [stakemor.com](https://stakemor.com) |
| Tokenomics · Capital | [Tokenomics](https://gitbook.mor.org/tokenomics.md) · [mor.org/capital](https://mor.org/capital) |
| Proposals (MRCs) | [GitBook](https://gitbook.mor.org/mrc/introduction.md) |

## Known gaps (good hackathon projects)

These are missing today. A project that fills one is useful beyond the event.

| Gap | Today |
|---|---|
| Per-customer delegated keys with their own limits and billing attribution | Account-level balance, usage and spending APIs exist. A builder can't yet issue each of their customers a key with its own limit |
| Pricing helper for providers | Bids are in MOR per second. Suppliers think in dollars per million tokens |
| Image generation | Not offered by the API |
| Anthropic-style `/messages` and `/responses` endpoints | Not offered. Claude Code needs a translator proxy (`morpheus/SETUP.md`) |
| An archived uptime series per provider | `active.mor.org/status` shows current health only |
| A walkthrough for building an app that earns builder emissions | Not documented |
| Maintained SDKs and templates | The TypeScript SDK and the CLI scaffold are dormant |

## Community and support

| Resource | Link |
|---|---|
| Questions about this kit | This repo's [Discussions](https://github.com/MorpheusAIs/Hackathon-kit/discussions) |
| Discord | [discord.gg/kyVaxTHnvB](https://discord.gg/kyVaxTHnvB) |
| X (announcements) | [@MorpheusAIs](https://x.com/morpheusais) |
| Blog | [mor.org/blog](https://mor.org/blog) |
| Feedback hub | [morpheus.featurebase.app](https://morpheus.featurebase.app) |
| Verified links (the official list) | [GitBook](https://gitbook.mor.org/verified-links.md) |
| Brand assets | [GitBook](https://gitbook.mor.org/brand-assets.md) |
| Security: bug bounty | [mor.org/bug-bounty](https://mor.org/bug-bounty) |

## Data and statistics

The [Verified Links](https://gitbook.mor.org/verified-links.md) page has the full list: CoinGecko, DefiLlama, Arkham, Dune and others. It also lists community sites that are independent of the core team, such as [morlord.com](https://morlord.com), [morstats.info](https://morstats.info) and [mor.builders](https://www.mor.builders).
