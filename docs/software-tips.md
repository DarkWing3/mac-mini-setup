---
layout: default
title: 소프트웨어 및 유용한 팁
---

# 소프트웨어 및 유용한 팁

[← 홈으로](index.md)

Mac Mini 세팅을 위한 필수 애플리케이션 및 권장 환경 설정 가이드입니다.

---

## Homebrew — 패키지 관리자

새로운 Mac을 설정할 때 가장 먼저 설치해야 하는 필수 도구입니다.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

설치 완료 후 PATH 환경 변수에 등록 (Apple Silicon 기준):
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
source ~/.zprofile
```

### 추천 패키지 설치

```bash
brew install git wget curl jq htop tree watch
brew install --cask visual-studio-code docker iterm2
```

---

## 터미널 환경 설정

### iTerm2 + Oh My Zsh

```bash
# iTerm2 설치
brew install --cask iterm2

# Oh My Zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`~/.zshrc` 파일의 플러그인 목록에 추가하면 유용한 항목:
```bash
plugins=(git docker kubectl zsh-autosuggestions zsh-syntax-highlighting)
```

---

## Git 기본 설정

```bash
git config --global user.name "사용자 이름"
git config --global user.email "이메일@주소.com"
git config --global core.editor "code --wait"

# GitHub용 SSH 키 생성
ssh-keygen -t ed25519 -C "이메일@주소.com"
cat ~/.ssh/id_ed25519.pub  # 출력된 공개키를 복사하여 GitHub → Settings → SSH keys에 등록
```

---

## Docker

```bash
brew install --cask docker
```

설치 후 `Docker.app`을 최초 1회 실행하여 초기 권한 설정을 완료한 뒤 버전을 확인합니다:
```bash
docker --version
docker run hello-world
```

---

## Node.js (nvm 사용 권장)

여러 Node.js 버전을 충돌 없이 깔끔하게 관리하기 위해 nvm을 사용합니다:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc

# LTS 최신 버전 설치 및 활성화
nvm install --lts
nvm use --lts
node --version
```

---

## Python (pyenv 사용 권장)

```bash
brew install pyenv

# ~/.zshrc에 환경 변수 및 초기화 스크립트 추가:
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Python 버전 설치 및 글로벌 설정
pyenv install 3.12
pyenv global 3.12
```

---

## macOS 시스템 유용한 팁

- **메뉴 막대 간소화**: 시스템 설정 → 제어 센터에서 자주 사용하지 않는 항목 숨김 처리
- **핫 코너(Hot Corners)**: 시스템 설정 → 데스크탑 및 Dock → 핫 코너 (예: 왼쪽 하단 모서리에 마우스를 두면 디스플레이 잠자기)
- **키 반복 속도 향상**: 시스템 설정 → 키보드에서 '키 반복 속도'를 '빠르게', '반복 지연 시간'을 '짧게'로 설정
- **Finder 상단에 전체 경로 표시**: `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true && killall Finder`
- **Finder 숨김 파일 토글**: 단축키 `⌘ ⇧ .`
