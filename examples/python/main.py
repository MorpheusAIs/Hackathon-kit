"""Minimal Morpheus example: one chat call and one tool call.

Env: MORPHEUS_API_KEY (required), MORPHEUS_BASE_URL, MODEL_PRIMARY, MODEL_FALLBACK.
Logs one JSON line per attempt: {ts, model, latency_ms, ok}. The key is never printed.
"""
import json
import os
import sys
import time
from datetime import datetime, timezone

from openai import APIConnectionError, APIStatusError, APITimeoutError, OpenAI

BASE_URL = os.environ.get("MORPHEUS_BASE_URL", "https://api.mor.org/api/v1")
PRIMARY = os.environ.get("MODEL_PRIMARY", "glm-5.3-flash")
FALLBACK = os.environ.get("MODEL_FALLBACK", "Claude Sonnet 5.5")

api_key = os.environ.get("MORPHEUS_API_KEY")
if not api_key:
    sys.exit("MORPHEUS_API_KEY is not set")

client = OpenAI(base_url=BASE_URL, api_key=api_key, timeout=60, max_retries=0)


def log(model, started, ok):
    print(json.dumps({
        "ts": datetime.now(timezone.utc).isoformat(),
        "model": model,
        "latency_ms": round((time.monotonic() - started) * 1000),
        "ok": ok,
    }))


def llm(messages, tools=None):
    """Try the primary model, retry once, then use the fallback model.

    Only timeouts, connection errors and 5xx responses are retried. Other errors
    (bad key, bad request) are raised at once.
    """
    for model in (PRIMARY, PRIMARY, FALLBACK):
        started = time.monotonic()
        try:
            kwargs = {"model": model, "messages": messages}
            if tools:
                kwargs["tools"] = tools
            resp = client.chat.completions.create(**kwargs)
            log(model, started, True)
            return resp
        except (APITimeoutError, APIConnectionError):
            log(model, started, False)
        except APIStatusError as err:
            log(model, started, False)
            if err.status_code < 500:
                raise
    raise RuntimeError("all Morpheus models failed")


def main():
    chat = llm([{"role": "user", "content": "Say hello in five words."}])
    print(chat.choices[0].message.content)

    tools = [{
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "Get the current weather for a city.",
            "parameters": {
                "type": "object",
                "properties": {"city": {"type": "string"}},
                "required": ["city"],
            },
        },
    }]
    resp = llm([{"role": "user", "content": "What is the weather in Paris?"}], tools)
    for call in resp.choices[0].message.tool_calls or []:
        print("tool call:", call.function.name, call.function.arguments)


if __name__ == "__main__":
    main()
