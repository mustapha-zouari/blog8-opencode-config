# blog8-opencode-config

A working example of the pattern in [Sharing Your opencode Setup with Git and Symbolic Links](https://mustapha-zouari.com/blog/8).

The repository holds the real configuration. `setup.sh` links it into `~/.config/opencode`, so every machine reads the same files.

## What is included

| Path                         | Purpose                                               |
| ---------------------------- | ----------------------------------------------------- |
| `opencode.jsonc`             | Playwright and GitHub MCP servers                     |
| `AGENTS.md`                  | Global working agreement                              |
| `agents/reviewer.md`         | Read-only code review subagent                        |
| `agents/issue-reporter.md`   | Read-only bug investigation and GitHub issue subagent |
| `skills/git-commit/`         | Conventional Commits and branch workflow              |
| `skills/java-code-style/`    | Concise Java style                                    |
| `skills/tech-documentation/` | Concise technical documentation and diagrams          |
| `secrets.env.example`        | Required environment variable names                   |
| `setup.sh`                   | Idempotent symlink setup                              |

## Prerequisites

- OpenCode 2.
- Node.js with `npx` for the Playwright MCP server.
- A GitHub personal access token for the GitHub MCP server. The example sets `oauth: false`; remove it and the `Authorization` header to use OAuth instead.

## Setup

```bash
git clone https://github.com/mustapha-zouari/blog8-opencode-config.git "$HOME/SourceRepo/blog8-opencode-config"
"$HOME/SourceRepo/blog8-opencode-config/setup.sh"
```

The script links `opencode.jsonc`, `AGENTS.md`, `agents`, and `skills` into `~/.config/opencode`. Existing files are moved to `.bak`. A stale link that points to an old checkout is replaced.

To use a different target directory, set `OPENCODE_CONFIG_DIR`:

```bash
OPENCODE_CONFIG_DIR=/tmp/opencode-config-test ./setup.sh
```

## Secrets

The GitHub MCP server reads `GITHUB_PAT_TOKEN` from the environment. Create the file outside the repository:

```bash
cp secrets.env.example "$HOME/.config/opencode/secrets.env"
chmod 600 "$HOME/.config/opencode/secrets.env"
```

Fill in the token, then load the file from your shell profile:

```bash
set -a
[ -f "$HOME/.config/opencode/secrets.env" ] && . "$HOME/.config/opencode/secrets.env"
set +a
```

Never commit `secrets.env`. The repository is public and every URL in it is public.

## Unlink

```bash
rm "$HOME/.config/opencode/opencode.jsonc"
rm "$HOME/.config/opencode/AGENTS.md"
rm "$HOME/.config/opencode/agents"
rm "$HOME/.config/opencode/skills"
```

Restore any `.bak` files if needed.

## License

MIT. See [LICENSE](LICENSE).
