---
layout: default
title: 셀프 호스팅 AI 에이전트
---

# 셀프 호스팅 AI 에이전트 구축

[← 홈으로](index.md)

Mac Mini에서 AI 에이전트와 자동화 워크플로우를 직접 실행하세요 — 클라우드 비용 없이 완벽한 데이터 프라이버시를 유지할 수 있습니다.

---

## Ollama — 로컬 LLM 서버

오픈소스 대형 언어 모델(Llama, Mistral, Gemma 등)을 Mac 로컬 환경에서 직접 구동합니다.

### 설치

```bash
brew install ollama
```

### 서버 실행

```bash
ollama serve
```

### 모델 다운로드 및 실행

```bash
ollama pull llama3.2
ollama run llama3.2
```

### REST API 호출 예시

```bash
curl http://localhost:11434/api/generate \
  -d '{"model": "llama3.2", "prompt": "안녕하세요!", "stream": false}'
```

---

## Open WebUI — Ollama를 위한 웹 채팅 인터페이스

로컬 모델과 손쉽게 대화할 수 있는 직관적인 웹 인터페이스입니다 (자체 호스팅되는 ChatGPT 스타일).

### Docker로 실행

```bash
docker run -d \
  --name open-webui \
  -p 3000:8080 \
  -v open-webui:/app/backend/data \
  --add-host=host.docker.internal:host-gateway \
  ghcr.io/open-webui/open-webui:main
```

웹 브라우저에서 [http://localhost:3000](http://localhost:3000) 접속

---

## n8n — 워크플로우 자동화 도구

Zapier나 Make의 오픈소스 셀프 호스팅 대안으로, 다양한 서비스와 API를 연결하고 AI 기반 자동화 파이프라인을 구축할 수 있습니다.

### Docker로 실행

```bash
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  n8nio/n8n
```

웹 브라우저에서 [http://localhost:5678](http://localhost:5678) 접속

---

## GitHub Actions 셀프 호스팅 러너

Mac Mini를 전용 CI/CD 빌드 머신으로 등록하여 빌드와 테스트를 로컬에서 수행합니다.

### 러너 등록 절차

1. 대상 GitHub 저장소 접속 → **Settings** → **Actions** → **Runners** → **New self-hosted runner** 클릭
2. 운영체제로 **macOS**를 선택하고 화면에 나타난 설치 명령어를 순서대로 실행합니다.
3. 러너 시작:
   ```bash
   ./run.sh
   ```

### 시스템 서비스로 등록 (부팅 시 백그라운드 자동 실행)

```bash
./svc.sh install
./svc.sh start
```

---

## 운영 및 활용 팁

- **launchd** 또는 **pm2**를 활용하면 Mac 재부팅 후에도 백그라운드 서비스가 끊김 없이 자동 실행됩니다.
- 공유기 설정에서 Mac Mini에 **고정 로컬 IP(Static IP)**를 지정해두면 내부 네트워크 접근 주소가 유지되어 편리합니다.
- **Tailscale**을 구성하면 외부 네트워크에서도 Mac Mini에 안전하게 원격 접속할 수 있습니다.
