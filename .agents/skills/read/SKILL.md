---
name: read
description: Invoke when given any URL, web page link, or PDF to read. Fetches content as clean Markdown with platform-specific routing. Not for local files already in the repo.
metadata:
  version: "4.0.0"
---

# Read: Fetch Any URL or PDF as Markdown

Convert any URL or local PDF to clean Markdown.

Before using any helper file from this skill, resolve `SKILL_DIR` as the absolute directory containing this `SKILL.md`. All helper paths below are relative to `SKILL_DIR`, not the current working directory.

## Routing

| Input | Method |
|-------|--------|
| GitHub URLs (`github.com`, `raw.githubusercontent.com`) | Prefer raw content or `gh` first. Use the proxy cascade only as fallback. |
| `.pdf` URL or local PDF path | PDF extraction |
| `feishu.cn`, `larksuite.com` | Feishu API script or direct fetch fallback |
| `mp.weixin.qq.com` | Proxy cascade first, Playwright fallback only if needed |
| Everything else | Use the available web tool first, then `"$SKILL_DIR/scripts/fetch.sh" {url}` as fallback |

After routing, load `references/read-methods.md` to get the exact commands for the chosen method, then execute them.

## Output Format

```text
Title:  {title}
Author: {author} (if available)
Source: {platform}
URL:    {original url}

Summary
{3-5 sentence summary}

Content
{full Markdown, truncated at 200 lines if long}
```

## Saving

Default to preview only. Save to a local file only if the user asks to save or the workflow clearly requires a persistent artifact. Tell the user the saved path when you write one.

After reporting the content or saved path, stop. Do not analyze or discuss the material unless asked. If content was truncated at 200 lines, say so and offer to continue.
