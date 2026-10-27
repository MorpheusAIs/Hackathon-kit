# Morpheus resource index

Every place to learn about or build on Morpheus. Links checked 2026-10-27. Agents can use [`llms.txt`](llms.txt), which holds the same index in a sweepable form.

## Official machine-readable indexes

| Index | Covers |
|---|---|
| [mor.org/llms.txt](https://mor.org/llms.txt) | Main site. Request pages with `Accept: text/markdown` to get markdown |
| [gitbook.mor.org/llms.txt](https://gitbook.mor.org/llms.txt) | Full documentation: protocol, tokenomics, contracts, builders, proposals (MRCs). Add `.md` to any page URL |
| [apidocs.mor.org/llms.txt](https://apidocs.mor.org/llms.txt) | Inference API docs, guides, integrations, API reference |
| [OpenAPI spec](https://apidocs.mor.org/api-reference/openapi.json) | API schema |

## Inference API

| Resource | Link |
|---|---|
| Account, API keys, credits | [app.mor.org](https://app.mor.org) |
| Base URL (OpenAI-compatible) | `https://api.mor.org/api/v1` |
| Live model list | [api.mor.org/api/v1/models](https://api.mor.org/api/v1/models) |
| Interactive API docs | [api.mor.org/docs](https://api.mor.org/docs) |
| Quickstart | [apidocs.mor.org/quickstart](https://apidocs.mor.org/quickstart.md) |
| Credits and billing | [Credits](https://apidocs.mor.org/documentation/getting-started/credits.md) · [Balance endpoint](https://apidocs.mor.org/api-reference/billing/balance.md) |
| Models, pricing, rate limits | [Models](https://apidocs.mor.org/documentation/models.md) · [Pricing](https://apidocs.mor.org/documentation/models/pricing.md) · [Rate limits](https://apidocs.mor.org/documentation/models/rate-limits.md) |
| Tool calling | [Guide](https://apidocs.mor.org/documentation/guides/tool-calling.md) |
| Vision | [Guide](https://apidocs.mor.org/documentation/guides/vision.md) |
| Embeddings | [Reference](https://apidocs.mor.org/api-reference/embeddings/create-embeddings.md) |
| Text to speech | [Reference](https://apidocs.mor.org/api-reference/audio/speech.md) |
| Health | [API health](https://apidocs.mor.org/api-reference/utility/health.md) · [Model health](https://apidocs.mor.org/api-reference/utility/health-models.md) |
| Fund with staked MOR instead of credits | [stakemor.com](https://stakemor.com) |

## Integrations (official guides)

[OpenAI Python SDK](https://apidocs.mor.org/documentation/integrations/openai-python-sdk.md) · [Vercel AI SDK v5](https://apidocs.mor.org/documentation/integrations/vercel-ai-sdk-integration.md) · [LangChain](https://apidocs.mor.org/documentation/integrations/langchain.md) · [Cursor](https://apidocs.mor.org/documentation/integrations/cursor.md) · [OpenCode](https://apidocs.mor.org/documentation/integrations/opencode.md) · [Eliza](https://apidocs.mor.org/documentation/integrations/eliza.md) · [n8n](https://apidocs.mor.org/documentation/integrations/n8n.md) · [Open WebUI](https://apidocs.mor.org/documentation/integrations/open-web-ui.md) · [Brave Leo](https://apidocs.mor.org/documentation/integrations/brave-leo.md)

## Templates and SDKs

All are in the [MorpheusAIs GitHub org](https://github.com/MorpheusAIs). Before you build on a template, check that its config points at `api.mor.org` and not at another AI gateway. The "Last push" column shows the date of the most recent push.

| Repo | What it is | Last push |
|---|---|---|
| [morpheus-chatbot](https://github.com/MorpheusAIs/morpheus-chatbot) | Next.js AI chatbot (GitHub template) | 2026-04 |
| [morpheus-coding-agent](https://github.com/MorpheusAIs/morpheus-coding-agent) | Multi-agent coding platform (GitHub template) | 2026-04 |
| [morpheus-open-agents](https://github.com/MorpheusAIs/morpheus-open-agents) | Cloud-agent template | 2026-04 |
| [morpheus-knowledge-agent](https://github.com/MorpheusAIs/morpheus-knowledge-agent) | Knowledge-base agent template | 2026-04 |
| [morpheus-community-agent](https://github.com/MorpheusAIs/morpheus-community-agent) | Slack community bot with an admin panel | 2026-04 |
| [x402-playground](https://github.com/MorpheusAIs/x402-playground) | Chat app that calls x402-paid APIs and MCP servers | 2025-10 |
| [api-gateway-typescript-sdk](https://github.com/MorpheusAIs/api-gateway-typescript-sdk) | TypeScript SDK for the gateway | 2025-12 |
| [create-morpheus-template](https://github.com/MorpheusAIs/create-morpheus-template) | CLI scaffold: Next.js + Web3 frontend | 2025-07 |

## The network (nodes, providers, protocol)

| Resource | Link |
|---|---|
| Node software (proxy-router) and releases | [Morpheus-Lumerin-Node](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node) · [Releases](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node/releases) |
| Inference marketplace | [GitBook](https://gitbook.mor.org/morpheus-inference-marketplace.md) |
| Compute node overview | [mor.org/morpheus-compute](https://mor.org/morpheus-compute) |
| Compute provider FAQ | [GitBook](https://gitbook.mor.org/faqs/compute-providers.md) |
| Smart contracts and deployed addresses | [GitBook](https://gitbook.mor.org/smart-contracts.md) |
| Whitepaper | [mor.org/whitepaper](https://mor.org/whitepaper) |

## Builders and capital

| Resource | Link |
|---|---|
| Builder welcome | [GitBook](https://gitbook.mor.org/builders/welcome-morpheus-builders.md) |
| Register a builder subnet | [Setup](https://gitbook.mor.org/builders/builder-subnet-setup.md) · [Emissions](https://gitbook.mor.org/builders/builder-subnet-emissions.md) |
| Builders API | [GitBook](https://gitbook.mor.org/builders/morpheus-builders-api.md) |
| Agent integration | [GitBook](https://gitbook.mor.org/builders/agent-integration.md) |
| Builders FAQ | [GitBook](https://gitbook.mor.org/faqs/builders.md) |
| Tokenomics | [GitBook](https://gitbook.mor.org/tokenomics.md) |
| Capital and staking | [mor.org/capital](https://mor.org/capital) · [Dashboard](https://dashboard.mor.org) |
| Proposals (MRCs) | [GitBook](https://gitbook.mor.org/mrc/introduction.md) |

## Community and support

| Resource | Link |
|---|---|
| Discord | [discord.gg/kyVaxTHnvB](https://discord.gg/kyVaxTHnvB) |
| X (announcements) | [@MorpheusAIs](https://x.com/morpheusais) |
| Blog | [mor.org/blog](https://mor.org/blog) |
| Feedback hub | [morpheus.featurebase.app](https://morpheus.featurebase.app) |
| Verified links (official list) | [GitBook](https://gitbook.mor.org/verified-links.md) |
| Brand assets | [GitBook](https://gitbook.mor.org/brand-assets.md) |
| Security: bug bounty | [mor.org/bug-bounty](https://mor.org/bug-bounty) |
| Questions about this kit | This repo's Discussions |

## Data and statistics

The [Verified Links](https://gitbook.mor.org/verified-links.md) page has the full list: CoinGecko, DefiLlama, Arkham, Dune and others.

Community sites listed there (independent of the core team): [morlord.com](https://morlord.com), [morstats.info](https://morstats.info), [mor.builders](https://www.mor.builders).
