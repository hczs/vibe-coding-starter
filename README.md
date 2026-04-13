[简体中文](./README.zh-CN.md)

# Vibe Coding Starter

This repository is a vibe coding starter for Codex. It comes with a set of practical repo-local skills and two sample `AGENTS.md` files, so you can use it as the starting point for a new project.

The best way to use it is not to fork it. Use GitHub's `Use this template` feature to create your own repository, then build on top of it, remove what you do not need, and tailor it to your workflow.

## What this repository is for

- A starter template for a new Codex project
- A baseline repository for team-wide vibe coding
- A starting point for your own skills and collaboration rules

## Repository structure

- `.agents/skills/`: local skills bundled with this repository and available to Codex
- `AGENTS-Python.md`: a sample collaboration rules file for Python projects
- `AGENTS-FastAPI.md`: a sample collaboration rules file for FastAPI projects

## How to start from this template

1. Click `Use this template` on GitHub
2. Create your new repository
3. Clone the new repository to your machine

```bash
git clone <your-new-repo-url>
cd <your-new-repo>
```

Then do three things based on what your project needs:

- Keep the skills you want and delete the ones you do not
- Pick a suitable `AGENTS*.md` file as your starting point and turn it into your repository rules
- Add your project code, tests, and engineering setup

## How to use these skills in Codex

These skills live under `.agents/skills/`. They are repo-local skills, so Codex can read and use them while working in this repository.

There are two common ways to use them:

- Explicit trigger: write the skill name directly in your prompt, such as `$think`, `$hunt`, or `$check`
- Implicit trigger: describe the task directly, such as "Help me find out why this test is failing first," and Codex will match the task to the right skill based on its description

If you want more stable behavior, use explicit skill names. For example:

- `$think Help me design the implementation plan for this feature`
- `$hunt Check why this endpoint returns 500`
- `$check Review this change`
- `$agile-git I am about to build a feature, help me sort out the branch and working tree first`

## Built-in skills

| Skill | When to use it | What it helps with |
| :--- | :--- | :--- |
| `$think` | Before a new feature, implementation plan, or architecture decision | Turns rough ideas into a clear plan that people can execute and approve |
| `$design` | When building UI, components, pages, or visual interfaces | Pushes the design toward a clear visual direction instead of a generic default |
| `$check` | After implementation, before commit, or before merge | Reviews the diff, finds risks, and covers missing checks |
| `$hunt` | When debugging errors, crashes, odd behavior, or failing tests | Finds the root cause before deciding on a fix |
| `$write` | When you explicitly want to write, rewrite, or polish Chinese or English copy | Makes the writing read more naturally and strips out the AI tone |
| `$write-a-prd` | When you want to write a PRD, plan a feature, or turn requirements into an implementation-ready issue | Drives user interviews, codebase exploration, and module design into a structured PRD |
| `$learn` | When entering an unfamiliar area, preparing a research article, or organizing source material | Moves the work through a full research workflow instead of scattered searching |
| `$read` | When reading a URL, web page, or PDF | Pulls external content into clean Markdown so Codex can keep working with it |
| `$anthropic-diagram` | When creating diagrams, flowcharts, architecture visuals, comparison charts, or swimlanes | Produces editorial-style `.drawio` diagrams in Anthropic's blog visual language |
| `$health` | When Codex behaves oddly, tool permissions look wrong, or collaboration rules feel messy | Checks the collaboration setup and repo constraints |
| `$agile-git` | When building features, fixing bugs, preparing commits, or handling branches | Guides Codex to use Git safely during implementation work |

## What the sample `AGENTS.md` files are for

`AGENTS.md` tells Codex how to work in your repository: how to collaborate, how to edit code, how to run checks, and what not to do.

This repository includes two examples:

- `AGENTS-Python.md`: fits general Python projects
- `AGENTS-FastAPI.md`: fits FastAPI projects

Most teams start from one of them, then copy or rewrite it into a repository-level `AGENTS.md`. Once those rules settle down, Codex keeps using them while it works in the repository.

## How to trim this template down

When you use this template in a real project, clean it up early:

- Remove the skills you will not use
- Keep the `AGENTS.md` rules that match your stack
- Rewrite the sample rules into rules your team will follow
- Add your project's own setup, test, and release instructions to `README.md`

## Reference

- https://github.com/tw93/Waza
