# Run your own Morpheus consumer node

**Goal:** send your product's AI calls straight into the Morpheus network (consumer node → provider sessions), without the app.mor.org gateway. Most hackathon teams do not need this. Use the gateway unless calling the network directly is part of your project.

## 1. Architecture
```
Your backend / teammates ──(Tailscale or an authenticated tunnel)──► auth proxy (per-user keys, rate limits)
                                                                        │
                                                       consumer node (proxy-router, consumer mode)
                                                                        │  opens sessions (stakes MOR)
                                                           Morpheus providers (on-chain bids)
Fallback: an app.mor.org gateway key (still Morpheus) if the node fails.
```

## 2. Facts that shape the design (check them against the current release)
- A session serves **one request at a time**. Two users at the same time need two sessions.
- The consumer node **stakes MOR for each session**. Closed sessions return the stake. Read the release notes for the current stake per session before you fund the wallet.
- The node needs MOR, ETH for gas, and an RPC endpoint.

## 3. Setup steps
1. **Check security first.** Use proxy-router **v7.14.0 or later**, which has the stream-ID and temp-path security fix. Use the [latest release](https://github.com/MorpheusAIs/Morpheus-Lumerin-Node/releases). Run `proxy-router --version` and record the result.
2. Install proxy-router in consumer mode.
3. Make a **dedicated node wallet**. Do not use a personal wallet.
4. Fund the wallet with MOR (the session stake) and ETH for gas.
5. Set the RPC endpoint. Use an RPC key for this node only.
6. Choose 2 models from the on-chain bids and check them with `preflight.sh`: a demo model and a fallback model. Prefer models whose provider passed a recent self-test.
7. Open **one session per concurrent user**, plus one for the live demo.
8. Put an **auth proxy** in front of the node's OpenAI-compatible port:
   - one API key per person;
   - a rate limit and a maximum request size;
   - log the model, latency and status only. Do not log prompts.
9. **Do not expose the router port to the internet.**
   - Teammates connect through Tailscale, with an ACL that permits only the proxy port.
   - A deployed product connects through an authenticated tunnel (for example Cloudflare Tunnel with an access token), or the backend runs on the node machine.
10. Test from a second machine: `MORPHEUS_BASE_URL=<proxy URL> MORPHEUS_API_KEY=<user key> ./morpheus/preflight.sh <demo model>`.
11. Set the fallback: if the node fails, the app switches to a gateway key.

## 4. Handoff page template (send it to each user privately)
```
Endpoint:   <proxy URL> (join the tailnet first)
Your key:   <where it is stored>. Do not share it.
API:        OpenAI-compatible. base_url = <proxy URL>/v1
Models:     <demo model> (fast) · <fallback model>
Limits:     <N> requests/min, <N> tokens/request, one request at a time per key
Status:     <how to see if the node is up>
If it fails: tell the operator; the app switches to the gateway fallback
Rules:      no secrets or personal data in prompts; no load tests; no sharing access
Revoke:     the operator removes your key and network access on request or on exit
```

## 5. Access rules
- One operator signs node-wallet transactions.
- Each user gets their own proxy key and network access. Keep a record of each grant.
- On exit: revoke the key, remove the network access, and rotate any shared key.
