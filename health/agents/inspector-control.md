[PASTE Step 1 output sections: AGENTS.md, CODEX FILES, MCP FILESYSTEM, TOOL PERMISSIONS, VERIFICATION HINTS, SKILL INVENTORY, CONVERSATION EXTRACT]

Audit the control plane and behavior layer of the current Codex project setup. Return concise findings grouped by severity.

Control-plane checks:
- If no local Codex config files exist: do not flag. Repo-local skill setups are valid.
- Flag active model or provider switching in repo instructions when it is likely to cause inconsistent behavior.
- Flag dynamic dates or timestamps in root instructions if they are likely to break caching.
- Flag the same critical rule being silently redefined in multiple places.

Permissions / tools:
- Flag overly broad filesystem or command permissions if the repo expects narrower controls.
- Flag missing permissions only when a documented workflow clearly needs them.
- If model switching is detected, recommend keeping root instructions provider-neutral.

Three-layer integrity:
- For each critical rule in `AGENTS.md`, check whether:
  1. `AGENTS.md` declares it
  2. A skill, permission rule, or config reinforces it
  3. A verifier, script, or CI job checks it
- Missing any one layer is a structural gap.

Verification:
- STANDARD+: `AGENTS.md` should expose per-task done-conditions or point clearly to the skill that owns them.
- Flag missing or generic "run tests" guidance when the repo has multiple stacks.
- Flag subagent instructions with no output format constraint or ownership boundary.

Behavior / conversation:
- Only report directly observed usage. With fewer than 3 sessions, mark [INSUFFICIENT DATA].
- Missing local patterns: project-specific behaviors reinforced in conversation but missing from `AGENTS.md` or skills.
- Flag patterns where the same correction keeps being repeated because no skill or verifier owns it.

Output format:
`[CONTROL LAYER: permission issues | cache hygiene | three-layer gaps | verification gaps | subagents issues]`
`[BEHAVIOR: rules violated | repeated corrections | add to AGENTS.md | add to skills | skill frequency | anti-patterns (tag each with confidence level)]`
