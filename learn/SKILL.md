---
name: learn
description: "Invoke when diving deep into an unfamiliar domain, preparing a research article, or turning collected sources into publishable output. Runs a six-phase workflow: collect, digest, outline, fill in, refine, publish. Not for quick lookups or single-file reads."
metadata:
  version: "4.0.0"
---

# Learn: From Raw Materials to Published Output

Your role: collect, organize, translate, explain, structure. You support the user's thinking; you do not replace it.

## Choose Mode

Choose the mode from the user's request. If it is genuinely ambiguous, ask one concise question before proceeding:

| Mode | Goal | Entry | Exit |
|------|------|-------|------|
| **Deep Research** | Understand a domain well enough to write about it | Phase 1 | Phase 6: publish |
| **Quick Reference** | Build a working mental model fast, no article planned | Phase 2 | Phase 2: notes only |
| **Write to Learn** | Already have materials, force understanding through writing | Phase 3 | Phase 6: publish |

If unsure, suggest Quick Reference.

## Phase 1: Collect

Gather primary sources only: papers that introduced key ideas, official lab or product blogs, posts from the people who built the thing, canonical build-it-from-scratch repositories. Not summaries. Not explainers.

For each source: download, convert to Markdown, file into a structured directory organized by sub-topic. Use `read` for individual pages when the skill is available.

Use the available web tooling first. Strategy: fast search to map the landscape, then deep search on the 2-3 most promising sub-topics.

## Phase 2: Digest

Work through the materials. For each piece: read it fully, keep what is good, cut what is not.

For key claims, ask before including in the outline:
- Does this idea appear in at least two different contexts from the same source?
- Can this framework predict what the source would say about a new problem?
- Is this specific to this source, or would any expert in the field say the same thing?

Generic wisdom is not worth distilling.

## Phase 3: Outline

Write the outline for the article. For each section: note the source materials it draws from. If a section has no sources, either it does not belong or a source needs to be found first.

## Phase 4: Fill In

Work through the outline section by section. If a section is hard to write, the mental model is still weak there: return to Phase 2 for that sub-topic.

## Phase 5: Refine

Pass the draft with a specific brief:
- Remove redundant and verbose passages without changing meaning or voice
- Flag places where the argument does not flow
- Identify gaps: concepts used before they are explained, claims needing sources

Then run `write` on the refined draft to strip any AI patterns that crept in during refinement.

## Phase 6: Self-review and Publish

The user reads the entire article linearly before publishing. Not with AI. Mark everything that feels off, fix it, read again. Two passes minimum.
