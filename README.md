# Mac Mini 설정 가이드 (mac-mini-setup)

팀을 위한 Mac Mini 활용 및 개발 환경 설정 가이드 사이트입니다.

- **라이브 사이트:** [https://darkwing3.github.io/mac-mini-setup/](https://darkwing3.github.io/mac-mini-setup/)
- **에이전트/개발 가이드:** [AGENTS.md](AGENTS.md)

---

## 코드 커밋 및 기여 가이드

팀의 일관된 협업과 명확한 변경 이력 관리를 위해 아래 규칙을 준수합니다.

### 1. 브랜치 생성 규칙

브랜치 이름은 **`NN.name`** 형식을 따릅니다:

- **`NN`**: `00`부터 시작하여 기존 가장 높은 번호에서 1씩 증가하는 **2자리 일련번호** (예: `00`, `01`, `02`, `03`, `04`...)
- **`name`**: 변경 내용을 설명하는 **20자 미만**의 영문 요약 (하이픈 `-` 구분)
- **예시**: `00.setup-pages`, `01.fix-links`, `04.commit-guide`

```bash
# 최신 main에서 브랜치 생성 및 전환
git checkout main
git pull origin main
git checkout -b NN.name
```

### 2. 커밋 메시지 작성 원칙 (Why 우선)

- 커밋 메시지는 **'무엇(What)'보다 '왜(Why)'를 먼저 작성**합니다.
- 변경 사항이 무엇인지 나열하기 전에, **왜 이 변경이 필요한지/어떤 문제를 해결하는지**를 먼저 설명합니다.

```bash
git commit -m "팀원 협업 표준화를 위해 코드 커밋 가이드 추가

- 브랜치 명명 규칙(NN.name) 정리
- 커밋 메시지 Why 우선 작성 원칙 안내
- PR 제목 및 머지 워크플로우 명시"
```

### 3. 풀 리퀘스트(PR) 및 머지 규칙

1. **PR 제목**: 반드시 브랜치의 `NN` 접두사로 시작해야 합니다.
   - 예: `04: 코드 커밋 가이드 추가`
2. **PR 본문**: PR 템플릿(`.github/pull_request_template.md`)에 따라 변경 이유(Why), 변경 내용(What), 테스트 계획(Test plan)을 충실히 작성합니다.
3. **머지**: PR 생성 및 검증 완료 후 `main` 브랜치에 머지합니다.

---

## 로컬 실행 방법

```bash
make install   # 의존성 패키지 설치 (docs/vendor/bundle)
make serve     # http://127.0.0.1:4000/mac-mini-setup/ 로컬 서버 실행
make stop      # 로컬 서버 중지
make build     # 정적 사이트 빌드 (docs/_site)
```
