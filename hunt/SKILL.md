---
name: hunt
description: Invoke when debugging any error, crash, unexpected behavior, or failing test. Finds root cause before applying any fix. Not for code review or new features.
metadata:
  version: "4.0.0"
---

# Hunt: Diagnose Before You Fix

A patch applied to a symptom creates a new bug somewhere else.

**Do not touch code until you can state the root cause in one sentence:**
> "I believe the root cause is [X] because [evidence]."

Name a specific file, function, line, or condition. If you cannot be that specific, you do not have a hypothesis yet.

## Rationalization Watch

| What you're thinking | What it actually means | Rule |
|---|---|---|
| "I'll just try this one thing" | No hypothesis, random-walking | Stop. Write the hypothesis first. |
| "I'm confident it's X" | Confidence is not evidence | Run an instrument that proves it. |
| "Probably the same issue as before" | Treating a new symptom as a known pattern | Re-read the execution path from scratch. |
| "It works on my machine" | Environment difference is the bug | Enumerate every environment difference before dismissing. |
| "One more restart should fix it" | Avoiding the error message | Read the last error verbatim. Never restart more than twice without new evidence. |

## Hard Rules

- Same symptom after a fix is a hard stop.
- After three failed hypotheses, stop and surface what is known, what was ruled out, and what is still unknown.
- Never state environment details from memory. Detect them first.
- External tool failure: diagnose before switching methods.
- Fix the cause, not the symptom.
- Verify the target code path exists before editing it.

## Confirm or Discard

Add one targeted instrument: a log line, a failing assertion, or the smallest test that would fail if the hypothesis is correct. Run it. If the evidence contradicts the hypothesis, discard it completely and re-orient.

## Outcome

```text
Root cause:  [what was wrong, file:line]
Fix:         [what changed, file:line]
Confirmed:   [evidence or test that proves the fix]
Tests:       [pass/fail count, regression test location]
```

Status: **resolved**, **resolved with caveats**, or **blocked**.
