---
layout: default
title: Software & Tips
---

# Software & Tips

[← Home](index.md)

Essential apps and configurations for the Mac Mini.

---

## Homebrew — Package Manager

The first thing to install on any Mac.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After install, add to PATH (Apple Silicon):
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
source ~/.zprofile
```

### Useful Homebrew packages

```bash
brew install git wget curl jq htop tree watch
brew install --cask visual-studio-code docker iterm2
```

---

## Terminal Setup

### iTerm2 + Oh My Zsh

```bash
# Install iTerm2
brew install --cask iterm2

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Useful plugins to add in `~/.zshrc`:
```
plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)
```

---

## Git Setup

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global core.editor "code --wait"

# Generate SSH key for GitHub
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub  # Copy this to GitHub → Settings → SSH keys
```

---

## Docker

```bash
brew install --cask docker
```

Open Docker.app once to complete setup, then verify:
```bash
docker --version
docker run hello-world
```

---

## Node.js (via nvm)

Manage multiple Node versions cleanly:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc

nvm install --lts
nvm use --lts
node --version
```

---

## Python (via pyenv)

```bash
brew install pyenv

# Add to ~/.zshrc:
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

pyenv install 3.12
pyenv global 3.12
```

---

## System Tips

- **Reduce Menu Bar clutter**: System Settings → Control Center → hide unused items
- **Hot Corners**: System Settings → Desktop & Dock → Hot Corners (e.g., bottom-left = sleep display)
- **Faster key repeat**: System Settings → Keyboard → set Key Repeat to Fast, Delay to Short
- **Show full path in Finder**: `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true && killall Finder`
- **Show hidden files in Finder**: `⌘ ⇧ .` (toggle)
