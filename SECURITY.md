# Security Policy

This repository is intended to stay secret-free.

## Rules for Contributors

- Do not commit AWS access keys, secrets, tokens, passwords, or private keys.
- Do not commit `terraform.tfstate` files or generated key material.
- Use environment variables, AWS profiles, or secret managers for sensitive values.
- Keep example values fake and non-production.

## Safer Defaults Already in Place

- RDS master password has no default value.
- Keypair generation does not save private keys to local files by default.
- `.gitignore` excludes common secret and state artifacts.

## Reporting Issues

If you find a secret or sensitive value in the repository, remove it immediately and rotate the credential if it was real.
