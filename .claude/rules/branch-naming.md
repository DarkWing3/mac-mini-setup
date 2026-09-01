# 브랜치 네이밍 규칙 (Branch naming)

브랜치는 `NN.name` 형식을 따릅니다:

- `NN` — `00`부터 시작하여 기존의 가장 높은 브랜치 번호에서 1씩 증가하는 2자리 일련번호.
- `name` — 20자 미만의 변경 사항을 설명하는 영문 이름.

예시: `00.setup-pages`, `01.fix-links`.

## PR 제목 규칙

PR의 제목은 브랜치 이름의 `NN` 번호로 시작해야 합니다.
예: `02.local-preview` 브랜치에서 생성된 PR 제목은 `02: Local Jekyll preview setup` 또는 `02: 로컬 Jekyll 미리보기 설정`.
