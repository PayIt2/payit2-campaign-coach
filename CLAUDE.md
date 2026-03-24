# CLAUDE.md

## Build

Before every commit, rebuild the single-file plugin:

```bash
./build-plugin.sh
```

This concatenates all skills, commands, agents, and references into `plugin.md` at the repo root. Always commit `plugin.md` alongside any changes to source files.
