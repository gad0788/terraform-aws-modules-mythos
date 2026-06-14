# AI Quick Start

Use this when you need to work in the repository quickly.

## Read First

- `AI_MEMORY.md`
- `AGENTS.md`
- `README.md`
- `docs/repo-settings.md`

## What This Repo Is

- A public Terraform AWS module library.
- Versioned with semantic release tags.
- Consumed by external apps through `demo-app/` or direct module references.

## Safe Workflow

1. Inspect the current tree.
2. Read the relevant module, workflow, or docs file.
3. Make the smallest safe edit.
4. Validate with Terraform or targeted checks.
5. Commit only when the change is complete.

## Useful Commands

```bash
terraform fmt -recursive
terraform validate
git status -sb
```

## Things To Avoid

- Pushing directly to `main`
- Editing generated docs manually if a workflow should own them
- Adding secrets or real account values
- Making release changes without updating release notes

## Common Targets

- `README.md` for public-facing quick start and badges
- `CONTRIBUTING.md` for PR and release rules
- `.github/workflows/` for automation
- `docs/repo-settings.md` for GitHub admin settings
