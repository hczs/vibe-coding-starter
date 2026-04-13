[English](./README.md)

# Vibe Coding Starter

这是一个给 Codex 用的 vibe coding 脚手架仓库。仓库里预置了一组实用的 repo-local skills，以及两份 `AGENTS.md` 示例文件，方便你直接把它当成新项目模板来起步。

最推荐的用法不是 fork，而是通过 GitHub 的 `Use this template` 功能直接生成你自己的仓库，然后在这个基础上继续开发、删减和定制。

## 这个仓库适合做什么

- 作为新的 Codex 项目模板
- 作为团队内部的 vibe coding 基线仓库
- 作为你自己的 skill 和协作规范起点

## 仓库结构

- `.agents/skills/`：本仓库内置的本地 skills，Codex 可以直接使用
- `AGENTS-Python.md`：Python 项目的协作约束示例
- `AGENTS-FastAPI.md`：FastAPI 项目的协作约束示例

## 如何基于这个模板开始

1. 在 GitHub 页面点击 `Use this template`
2. 创建你自己的新仓库
3. clone 新仓库到本地

```bash
git clone <your-new-repo-url>
cd <your-new-repo>
```

然后按你的项目需要做三件事：

- 保留需要的 skills，删除不需要的 skills
- 选择一份合适的 `AGENTS*.md` 作为起点，改成你的仓库规则
- 补充你的项目代码、测试和工程配置

## Codex 中如何使用这些 Skills

这些 skills 放在 `.agents/skills/` 下，属于 repo-local skills。Codex 在当前仓库工作时可以读取并使用它们。

有两种常见用法：

- 显式触发：在提示里直接写 `$think`、`$hunt`、`$check` 这类 skill 名称
- 隐式触发：直接描述任务，例如“先帮我排查这个测试为什么挂了”，Codex 会按 skill 描述匹配并使用合适的 skill

如果你希望行为更稳定，优先显式写 skill 名。比如：

- `$think 帮我设计这个新功能的实现方案`
- `$hunt 看下为什么这个接口返回 500`
- `$check 审一下这次改动`
- `$agile-git 我现在要做一个新功能，先帮我处理分支和工作区`

## 内置 Skills 说明

| Skill | 什么时候用 | 它解决什么问题 |
| :--- | :--- | :--- |
| `$think` | 开始新功能、设计方案、架构决策前 | 先把思路收敛成清晰、可执行、可批准的方案 |
| `$design` | 做 UI、组件、页面或视觉界面时 | 产出更有明确风格的设计，而不是平庸默认稿 |
| `$check` | 完成实现后、提交前、合并前 | 审查 diff、发现风险、补做必要检查 |
| `$hunt` | 排查报错、崩溃、异常行为、失败测试时 | 先找根因，再决定怎么修 |
| `$write` | 明确要写作、改写、润色中英文文案时 | 把文案改得更自然，去掉 AI 味 |
| `$write-a-prd` | 要写 PRD、规划新功能、或把需求整理成可落地 issue 时 | 通过用户访谈、代码库调研和模块设计沉淀出结构化 PRD |
| `$learn` | 进入陌生领域、准备研究文章、整理资料时 | 按完整研究流程推进，而不是零散搜索 |
| `$read` | 读取 URL、网页或 PDF 时 | 把外部内容抓成干净 Markdown 供 Codex 继续处理 |
| `$anthropic-diagram` | 需要创建示意图、流程图、架构图、对比图或泳道图时 | 生成带有 Anthropic 博客视觉风格的 `.drawio` 编辑型图表 |
| `$health` | Codex 行为异常、工具权限不对、协作配置混乱时 | 检查当前仓库的协作环境和约束问题 |
| `$agile-git` | 做新功能、修 bug、准备 commit、处理分支时 | 指导 Codex 在实现任务里安全地使用 Git |

## 新增 Skill：`$anthropic-diagram`

`$anthropic-diagram` 用来把想法、系统结构或业务流程整理成可编辑的 `.drawio` 图。它适合生成架构图、流程图、对比图、泳道图，以及各种偏说明性的视觉表达，不只是画一个“能看”的图，而是产出后续还能继续在 draw.io 里手工调整的图稿。

这个 skill 的重点是 Anthropic 博客那种偏 editorial 的图表风格：暖色画布、克制配色、清晰的信息层级、圆角容器、正交连线，以及围绕单一主结论组织版式。它支持英文和中文场景，适合在你希望 Codex 直接产出可交付图表文件时使用。

## `AGENTS.md` 示例文件是干什么的

`AGENTS.md` 用来告诉 Codex：在这个仓库里应该怎么协作、怎么改代码、怎么跑检查、哪些事情不能做。

这个仓库附带两份示例：

- `AGENTS-Python.md`：适合通用 Python 项目
- `AGENTS-FastAPI.md`：适合 FastAPI 项目

你通常会从其中一份开始，复制或改写成你自己的仓库级 `AGENTS.md`。一旦项目规则稳定下来，Codex 在这个仓库里工作时就会持续参考这些约束。

## 建议的裁剪方式

把这个模板用在真实项目里时，建议尽快做这些整理：

- 删掉你不会用到的 skills
- 保留与你技术栈匹配的 `AGENTS.md`
- 把示例规则改成你团队真实会执行的规则
- 在 `README.md` 里补上项目本身的启动、测试和发布方式

## 参考

- https://github.com/tw93/Waza
- https://github.com/dingtingli/dtl-skills
