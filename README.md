# workshop-test

Private team repo for **Cursor Agent Skills**: save skills here, share via git, and install into personal `~/.cursor/skills/` when you want them in every project.

## Layout

```text
.cursor/skills/          # team skills Cursor loads when this repo is open
  <skill-name>/
    SKILL.md             # required
    references/          # optional docs
    scripts/             # optional helpers
    assets/              # optional templates / samples
templates/skill/         # copy this when creating a new skill
scripts/install-skill.sh # install one skill into ~/.cursor/skills/
```

## Add a skill

1. Copy the template:

   ```bash
   cp -R templates/skill .cursor/skills/my-skill-name
   ```

2. Edit `.cursor/skills/my-skill-name/SKILL.md` (`name` + `description` + instructions).
3. Commit and push. Teammates pull to get it.

Drop an existing skill folder into `.cursor/skills/<name>/` the same way (must contain `SKILL.md`).

## Use a skill

| Goal | How |
| --- | --- |
| Use while working in this repo | Open this folder in Cursor — skills under `.cursor/skills/` load automatically |
| Use in other projects on your machine | `./scripts/install-skill.sh <skill-name>` (symlink into `~/.cursor/skills/`) |
| Invoke explicitly | `@skill-name` or `/skill-name` in chat |

## Conventions

- Folder name = skill `name` in frontmatter (lowercase, hyphens).
- Prefer `disable-model-invocation: true` unless the skill should auto-trigger from context.
- Keep secrets out of skills; document required env vars / MCP tools instead.
- Optional files only when needed — a skill can be a single `SKILL.md`.
