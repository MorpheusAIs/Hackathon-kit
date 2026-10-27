# Gateway setup (checked against api.mor.org on 2026-10-27)

## What the API offers
- OpenAI-compatible base URL: `https://api.mor.org/api/v1`. `GET /models` lists 250+ models. They include Claude, GPT, Gemini, Grok, GLM, Qwen, Kimi and DeepSeek, `:web` variants with built-in web search, and embedding models.
- Endpoints: `/chat/completions`, `/embeddings` and `/audio/speech` (text to speech). All need a key.
- **Not available:** an Anthropic-style `/messages` endpoint, `/responses`, and image generation. Plan around these gaps.

## Before you build
1. **One key per person** from [app.mor.org](https://app.mor.org). Do not share keys. Keep them in a password manager and `.env`, never in git.
2. **Funding:** buy credits at app.mor.org, or stake MOR to the API subnet ([stakemor.com](https://stakemor.com)). Check your balance with the [balance endpoint](https://apidocs.mor.org/api-reference/billing/balance.md).
3. **Preflight:** run `./morpheus/preflight.sh "<model A>" "<model B>"`. Then choose:
   - a **demo model**: fast, no long thinking, tool calls work. Thinking models can take more than a minute before the first token;
   - a **fallback model**, also on Morpheus;
   - an **embedding model**, if you need search or matching.
4. **Product code:** one `llm()` function that uses the OpenAI SDK with `baseURL = https://api.mor.org/api/v1`. Put both model IDs in `.env`. Log the model and the latency of each call.
5. **Guard:** run `./morpheus/no-other-vendors.sh` as a pre-commit hook and in CI.
6. **Web research inside your product:** use a `:web` model variant, so search also runs through Morpheus.

## Coding agents (your build tools, not your product)
- **Agents that accept an OpenAI-compatible provider** (for example OpenCode, Aider, Cursor) point straight at `api.mor.org/api/v1`. Refer to the [integration guides](https://apidocs.mor.org/llms.txt).
- **Claude Code** speaks `/messages`. It needs a local translator proxy, such as LiteLLM or claude-code-router, that turns `/messages` into `/chat/completions`, with `ANTHROPIC_BASE_URL` set to the proxy. Test tool calling and long sessions before you rely on it, because the translation can break tool use.
- Decide early and say which one truthfully: **all-Morpheus** (every token, including the build agents) or **product-on-Morpheus** (the judged product runs 100% on Morpheus; the build tools do not).

## On stage
Show the live call log: model ID, `api.mor.org`, latency. Keep a backup recording in case the venue Wi-Fi or a model fails.
