#!/bin/bash
# Build plugin.md - concatenates all skills, commands, agents, and references
# into a single file for easy installation.

set -e
cd "$(dirname "$0")"

OUTPUT="plugin.md"

cat > "$OUTPUT" << 'HEADER'
# PayIt2 Campaign Manager Plugin

AI-powered fundraising campaign manager for PayIt2.com. Create campaigns, generate content, engage donors, and optimize performance through conversation with Claude.

> This is a combined single-file version of the plugin. For the full source, see: https://github.com/PayIt2/payit2-campaign-manager

---

HEADER

# Commands
echo "## Commands" >> "$OUTPUT"
echo "" >> "$OUTPUT"
for f in commands/*.md; do
  name=$(basename "$f" .md)
  echo "### /$name" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  cat "$f" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  echo "---" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
done

# Skills
echo "## Skills" >> "$OUTPUT"
echo "" >> "$OUTPUT"
for dir in skills/*/; do
  skill_name=$(basename "$dir")
  if [ -f "$dir/SKILL.md" ]; then
    echo "### Skill: $skill_name" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$dir/SKILL.md" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    # Include references if they exist
    if [ -d "$dir/references" ]; then
      for ref in "$dir"/references/*.md; do
        ref_name=$(basename "$ref" .md)
        echo "#### Reference: $ref_name" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
        cat "$ref" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
      done
    fi
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  fi
done

# Agents
echo "## Agents" >> "$OUTPUT"
echo "" >> "$OUTPUT"
for f in agents/*.md; do
  name=$(basename "$f" .md)
  echo "### Agent: $name" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  cat "$f" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  echo "---" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
done

echo "Built $OUTPUT ($(wc -l < "$OUTPUT") lines)"
