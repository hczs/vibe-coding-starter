# Git Task Recipes For Codex

Use these recipes as defaults when the repo does not already define a different convention.

## 1. Inspect Before Acting

```bash
git status --short --branch
git branch --show-current
git rev-parse --show-toplevel
```

Use this at the start of feature work, bug fixing, commit prep, and PR prep.

## 2. Start A Feature Branch

Only when the tree is clean or the current changes clearly belong on the new branch:

```bash
git checkout main
git pull origin main
git checkout -b feature/123-short-slug
```

If the repo uses a different long-lived branch or naming scheme, follow the repo instead of this default.

## 3. Start A Bugfix Branch

```bash
git checkout main
git pull origin main
git checkout -b fix/245-login-timeout
```

Prefer to add or update a regression test before finalizing the fix.

## 4. Start A Hotfix Branch

```bash
git checkout main
git pull origin main
git checkout -b hotfix/301-payment-callback
```

Keep the patch narrowly scoped.

## 5. Review Only The Task Changes

```bash
git status --short
git diff --stat
git diff -- path/to/file
```

Use path-limited diff review when unrelated work exists in the tree.

## 6. Prepare A Safe Commit

When unrelated work exists, stage specific files instead of everything:

```bash
git add path/to/file1 path/to/file2
git diff --cached
git commit -m "feat(scope): short summary"
```

Avoid `git add .` in a dirty tree.

## 7. Dirty Tree Decision Rule

If the worktree is dirty before the new task starts:

- Inspect whether the changes are part of the current request.
- If yes, continue carefully and do not try to clean them up.
- If no, avoid switching branches or staging broadly until you understand the impact.
- Ask the user only when the ambiguity creates real risk.

## 8. PR Readiness Checklist

Before saying the work is ready:

- `git status --short` shows only expected files
- the diff matches the request
- validation commands ran
- commit grouping is clear if a commit was requested
