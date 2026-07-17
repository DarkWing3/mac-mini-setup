# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# Mac Mini Setup Guide

A GitHub Pages site for David & family — practical how-tos for the Mac Mini.

**Live site:** https://darkwing3.github.io/mac-mini-setup/
**Repo:** https://github.com/DarkWing3/mac-mini-setup

## Project Goal

Create easy-to-read guides that David and his wife can reference anytime. Topics include:

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

No local build step or Gemfile — GitHub Pages builds it on push.

## Guidelines

- Write for non-developers (David's wife should be able to follow along)
- Keep pages focused and scannable — use tables and code blocks
- Each page links back to index.md
- Use Jekyll front matter (`layout: default`, `title: ...`) on every page
- The `jekyll-relative-links` plugin is enabled, so internal links point directly at the `.md` file (e.g. `[Shortcuts](shortcuts.md)`), not `.html`
