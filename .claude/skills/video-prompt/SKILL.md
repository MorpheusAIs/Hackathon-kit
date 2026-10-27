---
name: video-prompt
description: Write production-ready prompts for an AI video tool (e.g. Veo, Runway, Kling, or a Seedance model) plus the shot list, voiceover, captions and edit plan for a 15–30 s vertical ad or demo teaser. Reads showcase/ads.md (the voiceover script) and research/design.md (the look). Writes showcase/video.md.
---

# AI video prompt pack

## Output: `showcase/video.md`
1. **Spec:** 9:16, 15–30 s, captions burned in, AI label on screen ("Includes AI-generated footage").
2. **Shot list:** 4–6 shots with timestamps. Each shot gives: duration, subject, action, camera (angle, movement, lens feel), lighting, setting, on-screen text, and whether it is AI footage or a **real product screen recording**. The product shot is always a real recording.
3. **One prompt per AI shot,** in this structure:
   `[subject] [action] in [setting], [camera move], [lens/framing], [lighting], [style matching research/design.md palette], [mood], 9:16, [duration]s. Avoid: text artifacts, extra fingers, logos, real people's likenesses.`
4. **Voiceover:** the 15 s script from `showcase/ads.md`, timed per shot. For ElevenLabs, give the voice style (e.g. calm, confident, 150 wpm) and label it as an AI voice.
5. **Music:** licensed library only (TikTok Commercial Music Library / Meta Sound Collection); give the mood and BPM.
6. **Edit plan (DaVinci Resolve):** the cut order, caption style (brand font, high contrast), the hook in the first 2 seconds, the call-to-action end card with the URL/QR.
7. **Variants:** one version per top hook (change only the first 3 seconds and the end card).

Rules: no real people's faces or voices without consent; no imitation of a celebrity; no fake product footage.
