// Minimal Morpheus example: one chat call and one tool call.
// Env: MORPHEUS_API_KEY (required), MORPHEUS_BASE_URL, MODEL_PRIMARY, MODEL_FALLBACK.
// Logs one JSON line per attempt: {ts, model, latency_ms, ok}. The key is never printed.
import OpenAI from "openai";

const BASE_URL = process.env.MORPHEUS_BASE_URL ?? "https://api.mor.org/api/v1";
const PRIMARY = process.env.MODEL_PRIMARY ?? "glm-5.3-flash";
const FALLBACK = process.env.MODEL_FALLBACK ?? "Claude Sonnet 5.5";

const apiKey = process.env.MORPHEUS_API_KEY;
if (!apiKey) {
  console.error("MORPHEUS_API_KEY is not set");
  process.exit(1);
}

const client = new OpenAI({ baseURL: BASE_URL, apiKey, timeout: 60000, maxRetries: 0 });

function log(model, started, ok) {
  console.log(
    JSON.stringify({
      ts: new Date().toISOString(),
      model,
      latency_ms: Math.round(performance.now() - started),
      ok,
    }),
  );
}

// Try the primary model, retry once, then use the fallback model.
// Only timeouts, connection errors and 5xx responses are retried. Other errors
// (bad key, bad request) are thrown at once.
async function llm(messages, tools) {
  for (const model of [PRIMARY, PRIMARY, FALLBACK]) {
    const started = performance.now();
    try {
      const params = { model, messages };
      if (tools) params.tools = tools;
      const resp = await client.chat.completions.create(params);
      log(model, started, true);
      return resp;
    } catch (err) {
      log(model, started, false);
      if (err instanceof OpenAI.APIError && err.status && err.status < 500) throw err;
    }
  }
  throw new Error("all Morpheus models failed");
}

const chat = await llm([{ role: "user", content: "Say hello in five words." }]);
console.log(chat.choices[0].message.content);

const tools = [
  {
    type: "function",
    function: {
      name: "get_weather",
      description: "Get the current weather for a city.",
      parameters: {
        type: "object",
        properties: { city: { type: "string" } },
        required: ["city"],
      },
    },
  },
];
const resp = await llm([{ role: "user", content: "What is the weather in Paris?" }], tools);
for (const call of resp.choices[0].message.tool_calls ?? []) {
  console.log("tool call:", call.function.name, call.function.arguments);
}
