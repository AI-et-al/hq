#!/bin/bash
# Claude Code status line: always-visible context-window usage.
# Install: cp to ~/.claude/statusline.sh && chmod +x, then add to ~/.claude/settings.json:
#   "statusLine": { "type": "command", "command": "~/.claude/statusline.sh" }
CC_STATUS_JSON="$(cat)" python3 -c '
import json, os, sys
try:
    d = json.loads(os.environ.get("CC_STATUS_JSON") or "{}")
except Exception:
    print("ctx ?"); sys.exit(0)
cw = d.get("context_window") or {}
pct = cw.get("used_percentage")
if pct is None:  # older schema: derive from token counts
    cu = cw.get("current_usage") or {}
    used = sum((cu.get(k) or 0) for k in ("input_tokens", "cache_creation_input_tokens", "cache_read_input_tokens"))
    size = cw.get("context_window_size") or 0
    pct = round(100 * used / size) if size else None
size_k = round((cw.get("context_window_size") or 0) / 1000)
model = (d.get("model") or {}).get("display_name", "")
cost = (d.get("cost") or {}).get("total_cost_usd")
parts = []
if pct is not None:
    filled = min(10, int(pct // 10))
    parts.append("ctx " + "█" * filled + "░" * (10 - filled) + f" {int(pct)}%" + (f" of {size_k}k" if size_k else ""))
if cost is not None:
    parts.append(f"${cost:.2f}")
if model:
    parts.append(model)
print(" · ".join(parts) or "ctx ?")
'
