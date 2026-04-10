---
name: agile-git
description: Use when the user asks to build a new feature, fix a bug, start a hotfix, prepare a commit, clean up a branch, or otherwise needs Codex to use Git while doing software work. Guides safe repo inspection, branch choice, change isolation, commit hygiene, and PR-ready delivery.
---

# Agile Git

Use Git as part of implementation work without damaging the user's branch state or unrelated changes. This skill is about how Codex should operate inside a repo while building and shipping changes.

## First Moves

At the start of any implementation task:

- Confirm the repo root and current branch.
- Inspect the worktree before changing anything.
- Identify whether the tree is clean, dirty with unrelated work, or already on a task branch.
- Preserve user changes. Never reset, discard, or overwrite them unless explicitly instructed.

Minimum inspection commands:

```bash
git status --short --branch
git branch --show-current
git rev-parse --show-toplevel
```

If the worktree is dirty, slow down and understand whether the existing changes are part of the task. Do not switch branches casually in a dirty tree.

## Operating Rules

- Default to non-destructive Git commands.
- Never use `git reset --hard`, `git checkout --`, or force-push unless the user explicitly asks.
- Do not rewrite history on shared branches unless the user asks for it.
- Do not commit or push unless the user asked for a commit, PR prep, or publish step.
- Stage only the files relevant to the task.
- Keep unrelated user edits out of commits.

## Choose The Branch Strategy

Always infer the local convention first. If the repo already uses a branch naming scheme, follow it. If there is no visible convention, use these defaults.

### New Feature

- Preferred branch: `feature/<ticket>-<slug>`
- Base branch: the primary integration branch, usually `main`
- Goal: small reviewable change set, fast merge, avoid long-lived drift

### Bug Fix

- Preferred branch: `fix/<ticket>-<slug>`
- If possible, reproduce first and add a regression test
- Keep the fix narrow and avoid opportunistic refactors

### Hotfix

- Preferred branch: `hotfix/<ticket>-<slug>`
- Base from the production branch, usually `main`
- Keep scope minimal and prioritize safe rollback

### Refactor Or Maintenance

- Preferred branch: `refactor/<slug>` or `chore/<slug>` if the repo uses these
- Separate pure refactors from behavior changes whenever possible

### If The Tree Is Dirty

When the user asks to "do a new feature" but the tree already has changes:

- Inspect what is already modified before creating or switching branches.
- If the existing changes are unrelated and switching risks conflicts, stay on the current branch and ask before moving work.
- If the user changes are clearly part of the task, continue without trying to clean them up.

## Task Playbooks

### Starting A New Task

1. Inspect branch and worktree.
2. Infer the correct base branch and naming convention.
3. If the user asked for a new branch and it is safe to switch, create it.
4. Implement in small logical slices.
5. Re-check status before finalizing.

Safe branch creation pattern:

```bash
git checkout main
git pull origin main
git checkout -b feature/123-short-slug
```

Only do this when the worktree is clean or when you have already confirmed the existing changes belong on the new branch.

### While Implementing

- Use `git status --short` often.
- Use `git diff -- <paths>` to inspect the exact files touched by the task.
- Avoid broad staging such as `git add .` when unrelated changes exist.
- Keep a mental commit plan even if the user has not asked you to commit yet.

### Preparing A Commit

When the user asks you to commit:

1. Confirm the exact files to include.
2. Review the diff.
3. Stage only task-relevant files.
4. Use a clear commit message.

Preferred commit style:

```text
feat(scope): short summary
fix(scope): short summary
refactor(scope): short summary
chore(scope): short summary
```

### Preparing A PR

Before declaring a branch PR-ready:

- Check `git diff --stat`.
- Re-read the main diff for accidental changes.
- Run the relevant tests or validation commands.
- Summarize what changed, how it was verified, and any risk areas.

### Hotfix Delivery

When the user asks for a production fix:

- Branch from the production branch.
- Avoid cleanup refactors or unrelated code motion.
- Verify the smallest possible scope.
- If tagging or release notes are requested, keep them separate from the fix itself.

## Commit Hygiene

- Prefer small, intention-revealing commits.
- Do not mix formatting, refactor, and behavior changes without a reason.
- Do not commit generated noise unless the repo expects it.
- If a larger task naturally breaks into multiple commits, group by logical units the reviewer can understand.

## What To Say To The User

When Git state matters, mention it explicitly in your update:

- current branch
- whether the tree is clean or dirty
- whether unrelated changes exist
- whether you created a branch
- whether the work is ready to commit or ready for PR

If blocked by ambiguous existing changes, ask one concise question instead of guessing.

## Reusable Recipes

Load [references/task-recipes.md](references/task-recipes.md) when you need concrete command patterns for starting feature work, preparing commits, or handling a dirty worktree.
