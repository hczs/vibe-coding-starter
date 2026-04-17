---
name: think
description: Invoke before writing any code for a new feature, design, or architecture decision. Turns rough ideas into approved plans with validated structure. Not for bug fixes or small edits.
metadata:
  version: "4.0.0"
---

# Think: Design and Validate Before You Build

Turn a rough idea into an approved plan. No code, no scaffolding, no pseudo-code until the user approves.

Give opinions directly. Take a position and state what evidence would change it. Avoid vague framing and generic option dumps.

## Before Reading Any Code

- Confirm the working path: `pwd` or `git rev-parse --show-toplevel`. Never assume `~/project` and `~/www/project` are the same.
- List every API key, token, and third-party account the task requires, with one-line explanations, before asking for any of them. No credential requests mid-implementation.
- Verify MCP servers, external APIs, and third-party CLIs are reachable before designing around them.
- Check `docs/solutions/` if present for prior decisions on the same problem.
- Search for related issues and PRs when the repo workflow or the user asks for that context.

## Propose Approaches

Offer 2-3 options with tradeoffs and a recommendation. Always include one minimal option. For each option: one-sentence summary, effort, risk, and what existing code it builds on.

For the recommendation: attack it first. What would make this fail? If the attack holds, deform the design and present the deformed version. If it shatters the approach entirely, discard it and say why.

Get approval before proceeding. If the user rejects, ask specifically what did not work. Do not restart from scratch.

## Validate Before Handing Off

- More than 8 files or 1 new service? Acknowledge it explicitly.
- More than 3 components exchanging data? Draw an ASCII diagram. Look for cycles.
- Every meaningful test path listed: happy path, errors, edge cases.
- Can this be rolled back without touching data?

**No placeholders in approved plans.** Every step must be concrete before approval. Forbidden patterns: TBD, TODO, "implement later," "similar to step N," "details to be determined."

## Gotchas

| What happened | Rule |
|---------------|------|
| Moved files to `~/project`, repo was at `~/www/project` | Run `pwd` before the first filesystem operation |
| Asked for API key after 3 implementation steps | List every dependency before starting |
| User said "帮我做" and got 3 options | Stay in planning mode. Lead with the recommended option, and treat user acceptance as plan approval, not implementation approval. |
| Planned MCP workflow without checking if MCP was loaded | Verify tool availability before the first design step |
| Rejected design restarted from scratch | Ask what specifically failed, re-enter with narrowed constraints |
| Built against wrong regional API | List all regional differences before writing integration code |
| Added a new runtime without approval | Never add a new language or runtime without explicit approval |
| User said "just do it" before approving the design | Treat it as approval of the last option presented. State which option was selected, then finish the plan. Do not implement inside `think`. |

## Output

**Approved design summary:**
- **Building**: what this is
- **Not building**: explicit out-of-scope list
- **Approach**: chosen option with rationale
- **Key decisions**: 3-5 with reasoning
- **Unknowns**: only items explicitly deferred with a stated reason and a clear owner

After the user approves the design, stop. Implementation starts only when requested.
