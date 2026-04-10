[PASTE Step 1 output sections: AGENTS.md, NESTED AGENTS.md, SKILL INVENTORY, SKILL FRONTMATTER, SKILL FULL CONTENT, VERIFICATION HINTS, CI FILES, CODEX FILES, MCP, MCP Live Status]

Audit the context and structure of the current Codex project setup. Return concise findings grouped by severity.

AGENTS.md checks:
- ALL: Flag nested `AGENTS.md` files; stacked project instructions are hard to reason about.
- SIMPLE: A missing `AGENTS.md` is acceptable only if the repo is intentionally skill-only and still has clear verification guidance.
- STANDARD+: Root `AGENTS.md` should describe how repository rules relate to the skill set.
- COMPLEX: Keep root `AGENTS.md` concise; move long operational detail into skills.

Skill checks:
- Verify every public skill entrypoint is under `.agents/skills/<name>/SKILL.md`.
- Flag broken references, missing helper files, and stale path mentions.
- Flag helper commands that assume a particular current working directory instead of resolving paths from the skill location.
- Flag docs or skill text that still references removed platforms or obsolete paths.

Verification checks:
- Verify the repo exposes at least one real verification path: scripts, CI, or documented commands.
- Flag done-conditions in instructions that do not map to a real command or workflow.

Filesystem / MCP:
- Check if MCP servers named in config are actually relevant to this repo.
- Estimate startup overhead from instructions + skill descriptions + MCP inventory.
- Flag overly broad or overly vague tool-permission guidance.

Repo hygiene:
- Flag leftover platform-specific files that should have been removed in a Codex-only repo.
- Flag duplicated skill roots or symlink indirection that makes provenance unclear.

Output format:
`[CONTEXT LAYER: AGENTS.md issues | skill issues | MCP cost | verifier gaps | stale platform files]`
