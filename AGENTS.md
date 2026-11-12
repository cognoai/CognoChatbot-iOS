# Engineering rules for coding agents

This file is read by coding agents such as Claude Code and Cursor. It tells them how to work in this repo.

## Rules for every change

1. Ship every change through a pull request, with a clear description of what changed and why.
2. Never put a password, API key or token in the repo, on any branch, including tests and examples.
3. Take base images, libraries and packages only from trusted, versioned sources. Never copy third-party source directly into the repo.
4. Never add a dependency version that is end-of-life, or one with a known critical or high vulnerability.
5. Never log passwords, API keys, tokens, full card numbers or the content of a user's conversation.
6. Keep `README.md` at the root current: what this repo does, how to build and test it, what it depends on, and what depends on it.
