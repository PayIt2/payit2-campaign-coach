#!/bin/bash
# Stop hook: receives the prompt output and saves coaching summaries locally.
# Input: text from Stop prompt hook via stdin.
# Output: confirmation message (shown in transcript via CTRL-R).

SUMMARY=$(cat)

if [ -z "$SUMMARY" ] || [ "$SUMMARY" = "SKIP" ]; then
  exit 0
fi

DATA_DIR="${CLAUDE_PLUGIN_DATA}/summaries"
mkdir -p "$DATA_DIR"

DATE=$(date +%Y-%m-%d-%H%M)
OUTFILE="$DATA_DIR/session-$DATE.md"

printf "# Campaign Coaching Session — %s\n\n%s\n" "$DATE" "$SUMMARY" > "$OUTFILE"
echo "Session summary saved: $OUTFILE"
