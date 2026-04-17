---
name: check
description: Invoke after any implementation task completes or before merging. Reviews the diff, auto-fixes safe issues, runs specialist security and architecture reviewers on large diffs. Not for exploring ideas or debugging.
metadata:
  version: "4.0.0"
---

# Check: Review Before You Ship

Read the diff, find the problems, fix what can be fixed safely, ask about the rest. Done means verification ran in this session and passed.

Before using any helper file from this skill, resolve `SKILL_DIR` as the absolute directory containing this `SKILL.md`. All helper paths below are relative to `SKILL_DIR`, not the current working directory.

## Get the Diff

Get the full diff between the current branch and the base branch. If unclear, ask. If already on the base branch, ask which commits to review.

## Scope

Measure the diff and classify depth:

| Depth | Criteria | Reviewers |
|-------|----------|-----------|
| **Quick** | Under 100 lines, 1-5 files | Base review only |
| **Standard** | 100-500 lines, or 6-10 files | Base + conditional specialists |
| **Deep** | 500+ lines, 10+ files, or touches auth/payments/data mutation | Base + all specialists + adversarial pass |

State the depth before proceeding.

## Did We Build What Was Asked?

Before reading code, check scope drift: do the diff and the stated goal match? Label: **on target** / **drift** / **incomplete**.

## Hard Stops

- Destructive auto-execution that mutates user-visible state without confirmation
- Release artifacts missing
- Translated file naming collision
- GitHub issue or PR number mismatch
- Unknown identifiers introduced by the diff
- Injection and validation gaps
- Unexpected dependency changes

## Specialist Review

Load `references/persona-catalog.md` to determine which specialists activate.

If sub-agents are available and allowed, run the activated specialists in parallel and pass the full diff. If they are not available, perform equivalent specialist passes locally and label them clearly in the final sign-off.

Merge findings by keeping the more severe duplicate and noting cross-reviewer agreement when it raises confidence.

## Autofix Routing

| Class | Definition | Action |
|-------|------------|--------|
| `safe_auto` | Unambiguous, risk-free: typos, missing imports, style inconsistencies | Apply immediately |
| `gated_auto` | Likely correct but changes behavior: null checks, error handling additions | Batch into one direct user question |
| `manual` | Requires judgment: architecture, behavior changes, security tradeoffs | Present in sign-off |
| `advisory` | Informational only | Note in sign-off |

Apply all `safe_auto` fixes first. Batch all `gated_auto` into one confirmation block. Never ask separately about each one.

## Adversarial Pass

For deep reviews, ask: "If I were trying to break this system through this diff, what would I exploit?" Use the four attack angles in `references/persona-catalog.md`. Suppress low-confidence findings.

## GitHub Operations

Use `gh` CLI for GitHub interactions when available. Confirm CI passes before merging.

## Verification

Run `bash "$SKILL_DIR/scripts/run-tests.sh"` from the project root, or run the project's known verification command. Paste the full output.

If the script exits non-zero or prints `(no test command detected)`: halt. Do not claim done. Ask the user for the verification command before proceeding. If none exists, document `verification: none -- no command available` and flag it as a structural gap, not a pass.

For bug fixes: a regression test that fails on the old code must exist before the fix is done.

## Sign-off

```text
files changed:    N (+X -Y)
scope:            on target / drift: [what]
review depth:     quick / standard / deep
hard stops:       N found, N fixed, N deferred
specialists:      [security, architecture] or none
new tests:        N
verification:     [command] -> pass / fail
```
