---
layout: default
title: Self-Hosted Agents
---

# Self-Hosted Agents

[← Home](index.md)

Run AI agents and automation on your Mac Mini — no cloud costs, full privacy.

---

## Ollama — Local LLM Server

Run open-source LLMs (Llama, Mistral, Gemma, etc.) locally.

### Install

```bash
brew install ollama
```

### Start the server

```bash
ollama serve
```

### Pull and run a model

```bash
ollama pull llama3.2
ollama run llama3.2
```

### API usage

```bash
curl http://localhost:11434/api/generate \
  -d '{"model": "llama3.2", "prompt": "Hello!", "stream": false}'
```

---

## Open WebUI — Chat Interface for Ollama

A web UI to chat with your local models (like ChatGPT but self-hosted).

### Install via Docker

```bash
docker run -d \
  --name open-webui \
  -p 3000:8080 \
  -v open-webui:/app/backend/data \
  --add-host=host.docker.internal:host-gateway \
  ghcr.io/open-webui/open-webui:main
```

Open [http://localhost:3000](http://localhost:3000)

---

## n8n — Workflow Automation Agent

Self-hosted alternative to Zapier/Make — connect apps and build AI workflows.

### Install via Docker

```bash
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  n8nio/n8n
```

Open [http://localhost:5678](http://localhost:5678)

---

## GitHub Actions Self-Hosted Runner

Run your own CI/CD runner on the Mac Mini.

### Setup

1. Go to your GitHub repo → **Settings** → **Actions** → **Runners** → **New self-hosted runner**
2. Select **macOS** and follow the install instructions
3. Start the runner:
   ```bash
   ./run.sh
   ```

### Register as a service (auto-start)

```bash
./svc.sh install
./svc.sh start
```

---

## Tips

- Use **launchd** or **pm2** to keep services running after reboot.
- Set a **static local IP** for the Mac Mini in your router to keep URLs stable.
- Use **Tailscale** to access your agents remotely from any device.
