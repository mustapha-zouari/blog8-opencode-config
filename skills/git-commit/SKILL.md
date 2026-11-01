---
name: git-commit
description: Use when committing, branching, or preparing a pull request. Defines Conventional Commits, branch naming, and the verify-before-commit gate.
---

# Git commits and branches

## Commit format

Use Conventional Commits:

```text
<type>(<scope>): <subject in imperative, no period>

<body: optional short bullet list>
```

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `perf`, `ci`.

Examples: `feat(auth): add session refresh`, `fix(api): return 404 for a missing invoice`.

## Rules

1. One logical change per commit.
2. Branch from the default branch: `feat/<topic>`, `fix/<topic>`, `docs/<topic>`, `chore/<topic>`.
3. Run the project's verification command before committing code. Skip it only when the change cannot affect the checks.
4. Stage explicit paths. Never commit secrets, dependencies, generated files, or build output.
5. Keep the subject in the imperative mood and the body focused on what changed and why.

## Procedure

1. Read `git status` and `git diff`; unstage anything outside the logical change.
2. Run the relevant checks.
3. Stage explicit paths and write the message.
4. For a pull request, use the same title convention and link the relevant issue or specification.
