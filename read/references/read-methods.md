# Read Methods Reference

Prefer the built-in web tool when it is available. Use the methods below as deterministic fallbacks or when you need a reproducible shell command.

Resolve `SKILL_DIR` as the absolute directory containing this skill's `SKILL.md`. Use helper scripts via `"$SKILL_DIR/scripts/..."`, never by assuming the current working directory.

## Proxy Cascade

Try in order. Success means non-empty output with readable content. If a proxy returns empty output, an error page, or only a handful of lines, treat it as failed and try the next method.

### 1. defuddle.md

```bash
curl -sL "https://defuddle.md/{url}"
```

### 2. r.jina.ai

```bash
curl -sL "https://r.jina.ai/{url}"
```

### 3. Built-in web reader

If the current agent has a web reader, use it before local fallback. It handles JavaScript-rendered pages better than free proxies.

### 4. Local tools

```bash
npx agent-fetch "{url}" --json
# or
defuddle parse "{url}" -m -j
```

## GitHub URLs

Prefer raw file content or `gh`:

```bash
curl -sL "https://raw.githubusercontent.com/{user}/{repo}/{branch}/{path}"

gh api repos/{user}/{repo}/contents/{path} --jq '.content' | base64 -d
```

Use the proxy cascade only as a fallback for rendered pages such as issues or README views.

## PDF to Markdown

### Remote PDF URL

```bash
curl -sL "https://r.jina.ai/{pdf_url}"
```

If that fails:

```bash
curl -sL "{pdf_url}" -o /tmp/input.pdf
pdftotext -layout /tmp/input.pdf -
```

### Local PDF file

```bash
marker_single /path/to/file.pdf --output_dir /tmp/
pdftotext -layout /path/to/file.pdf - | sed 's/\f/\n---\n/g'
python3 -c "
import pypdf, sys
r = pypdf.PdfReader(sys.argv[1])
print('\n\n'.join(p.extract_text() for p in r.pages))
" /path/to/file.pdf
```

Use `marker` when layout matters. Use `pdftotext` for speed.

## Feishu / Lark Document

```bash
pip install requests
export FEISHU_APP_ID=your_app_id
export FEISHU_APP_SECRET=your_app_secret
python3 "$SKILL_DIR/scripts/fetch_feishu.py" "{url}"
```

## WeChat Public Account

Use the proxy cascade first.

If the proxy is blocked, use the Playwright script as a last resort:

```bash
pip install playwright beautifulsoup4 lxml && playwright install chromium
python3 "$SKILL_DIR/scripts/fetch_weixin.py" "{url}"
```
