---
name: health
description: Invoke when Codex ignores instructions, behaves inconsistently, tool permissions or MCP look wrong, or the project rules feel fragmented. Audits the project collaboration stack and flags issues by severity. Not for debugging code or reviewing PRs.
metadata:
  version: "4.0.0"
---

# Codex Project Health Audit

Audit the current project's Codex setup with the five-layer framework:
`AGENTS.md → .agents/skills → tool permissions + MCP → subagents → verifiers`

The goal is to find violations and identify the misaligned layer, calibrated to project complexity.

**Output language:** Check in order: (1) `AGENTS.md` communication rules if present; (2) language of the user's recent messages; (3) default English.

Before using any helper file from this skill, resolve `SKILL_DIR` as the absolute directory containing this `SKILL.md`. All helper paths below are relative to `SKILL_DIR`, not the current working directory.

## Step 0: Assess project tier

| Tier | Signal | What's expected |
|------|--------|-----------------|
| **Simple** | <500 project files, 1 contributor, no CI | `AGENTS.md` or a small skill set; explicit verification command preferred |
| **Standard** | 500–5K project files, small team or CI present | `AGENTS.md`, multiple skills, basic verification, documented tool constraints |
| **Complex** | >5K project files, multi-contributor, multi-language, active CI | Full five-layer setup required |

Apply only the detected tier's requirements.

## Step 1: Collect all data

Run `bash "$SKILL_DIR/scripts/collect-data.sh"` from the project root.

## Step 1b: MCP Live Check

For each MCP server found in project or user config, attempt a lightweight call and record whether it responds.

## Step 2: Analyze with tier-adjusted depth

Summarize what was collected, confirm the tier, then proceed:

- **SIMPLE:** Analyze locally from Step 1 data. Prioritize core config checks.
- **STANDARD/COMPLEX:** If subagents are available and allowed, launch two in parallel with sanitized data pasted inline. Otherwise analyze locally and note that specialist passes were inlined.

### Agent 1 -- Context + Security Audit

Read `agents/inspector-context.md`.

### Agent 2 -- Control + Behavior Audit

Read `agents/inspector-control.md`.

## Step 3: Synthesize and present

```text
Health Report: {project} ({tier} tier, {file_count} files)
```

Include:
- `[PASS]` checks that are actually relevant
- `[!]` critical issues that need immediate fixes
- `[~]` structural issues to fix soon
- `[-]` incremental improvements worth noting

If all issue sections are empty, output one short line in the output language like: `All relevant checks passed. Nothing to fix.`

After the report, ask:
> "Should I draft the changes? I can handle each layer separately: AGENTS.md / skills / tool permissions / MCP / verification."
