# AGENTS.md

이 파일은 저장소의 코드를 작업하는 AI 코딩 에이전트를 위한 가이드라인을 제공합니다.

# Mac Mini 설정 가이드

팀을 위한 GitHub Pages 사이트 — Mac Mini 사용을 위한 실용적인 가이드 문서입니다.

**라이브 사이트:** https://darkwing3.github.io/mac-mini-setup/
**저장소:** https://github.com/DarkWing3/mac-mini-setup

## 프로젝트 목표

팀원 누구나 언제든지 참고할 수 있는 읽기 쉬운 가이드를 작성합니다. 주요 주제는 다음과 같습니다:

- Mac 키보드 단축키
- 개발용 Mini Kubernetes (k8s) 구축
- 셀프 호스팅 AI 에이전트 실행 (Ollama, n8n, GitHub Actions runner)
- 소프트웨어 설치 및 macOS 유용한 팁

## 문서 구조

모든 Jekyll 사이트 콘텐츠는 `docs/` 폴더 아래에 위치합니다 (GitHub Pages가 이 폴더에서 빌드되도록 설정됨). `README.md`, `AGENTS.md`, `CLAUDE.md`는 저장소 루트에 유지됩니다.

```
docs/
  _config.yml            # Jekyll 설정 (theme: minima)
  index.md               # 메인 홈페이지 / 목차
  shortcuts.md           # Mac 키보드 단축키 모음
  k8s-setup.md           # 로컬 Kubernetes 클러스터 구축
  self-hosted-agents.md  # 셀프 호스팅 AI 에이전트 및 자동화
  software-tips.md       # Homebrew, 터미널 환경, 개발 도구
```

GitHub Pages는 `.github/workflows/pages.yml`을 통해 푸시 시 자동으로 빌드 및 배포되므로 별도의 수동 배포 단계가 필요하지 않습니다. `docs/Gemfile`은 로컬 미리보기를 위해 사용됩니다.

## 로컬 미리보기

Ruby >= 3.0 이상이 필요합니다 (macOS 기본 시스템 Ruby는 버전이 낮음). `brew install ruby`로 설치한 후 루트의 `Makefile`을 사용하세요:

```bash
make install   # docs/vendor/bundle 경로에 번들 의존성 설치
make serve     # http://127.0.0.1:4000/mac-mini-setup/ 주소로 로컬 서버 실행
make build     # docs/_site 폴더로 정적 사이트 빌드
make clean     # 빌드 결과물 정리
```

`make serve` 실행 시 파일이 수정되면 자동으로 사이트가 다시 생성됩니다. Makefile 내부에서 Homebrew Ruby의 PATH 설정이 처리되므로 별도의 `export PATH`를 설정할 필요가 없습니다.

## 작성 가이드라인

- **문서 언어**: 모든 가이드 및 문서는 **한국어**로 작성합니다.
- **가독성**: 비개발자도 쉽게 이해할 수 있도록 작성합니다 (기술 배경이 없는 팀원도 쉽게 따라 할 수 있는 설명).
- **구성**: 표와 코드 블록을 활용하여 읽기 쉽고 직관적으로 작성합니다.
- **네비게이션**: 각 페이지 상단에 메인 홈으로 돌아가는 링크(`[← 홈으로](index.md)`)를 포함합니다.
- **프론트 매터**: 모든 페이지 상단에 Jekyll 프론트 매터(`layout: default`, `title: ...`)를 포함합니다.
- **내부 링크**: `jekyll-relative-links` 플러그인이 활성화되어 있으므로, 내부 링크는 `.html`이 아닌 `.md` 파일을 직접 가리킵니다 (예: `[단축키 모음](shortcuts.md)`).
- **'이유(Why)' 우선**: 커밋 메시지, PR 설명, 이슈는 변경 사항이 "무엇인지" 설명하기 전에 "왜 필요한지"를 먼저 설명합니다 (`.github/pull_request_template.md` 및 `.github/ISSUE_TEMPLATE/` 참조).
