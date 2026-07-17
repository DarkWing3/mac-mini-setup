# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# Mac Mini Setup Guide

A GitHub Pages site for the family — practical how-tos for the Mac Mini.

**Live site:** https://darkwing3.github.io/mac-mini-setup/
**Repo:** https://github.com/DarkWing3/mac-mini-setup

## Project Goal

Create easy-to-read guides the whole family can reference anytime. Topics include:

- Keyboard shortcuts
- Mini Kubernetes (k8s) for development
- Running self-hosted agents (Ollama, n8n, GitHub Actions runner)
- Software installs and general Mac tips

## Structure

All Jekyll site content lives under `docs/` (GitHub Pages is configured to build from this folder). `README.md` and `CLAUDE.md` stay at the repo root.

```
docs/
  _config.yml            # Jekyll config (theme: minima)
  index.md               # Home page / table of contents
  shortcuts.md           # Mac keyboard shortcuts
  k8s-setup.md           # Local Kubernetes setup
  self-hosted-agents.md  # Self-hosted AI agents & automation
  software-tips.md       # Homebrew, terminal, dev tools
```

GitHub Pages builds and deploys automatically on push via `.github/workflows/pages.yml` — no manual deploy step needed. `docs/Gemfile` exists solely for local preview (see below).

## Local preview

Requires Ruby >= 3.0 (macOS's system Ruby is too old). Install via `brew install ruby`, then use the root `Makefile`:

```bash
make install   # bundle install into docs/vendor/bundle
make serve     # run the local server at http://127.0.0.1:4000/mac-mini-setup/
make build     # build the static site into docs/_site
make clean     # remove build artifacts
```

`make serve` auto-regenerates on file changes. The Makefile handles the Homebrew-Ruby-on-PATH gotcha internally, so no manual `export PATH` is needed.

## Guidelines

- Write for non-developers (any non-technical family member should be able to follow along)
- Keep pages focused and scannable — use tables and code blocks
- Each page links back to index.md
- Use Jekyll front matter (`layout: default`, `title: ...`) on every page
- The `jekyll-relative-links` plugin is enabled, so internal links point directly at the `.md` file (e.g. `[Shortcuts](shortcuts.md)`), not `.html`
- Lead with **why**, not what: commit messages, PR descriptions, and issues should explain why the change/issue matters before describing what it does — see `.github/pull_request_template.md` and `.github/ISSUE_TEMPLATE/`
