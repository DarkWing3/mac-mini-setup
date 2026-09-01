---
layout: default
title: Mini Kubernetes 구축 가이드
---

# 개발용 Mini Kubernetes (k8s) 구축

[← 홈으로](index.md)

Mac Mini에 가벼운 로컬 Kubernetes 클러스터를 구축하여 클라우드 비용 없이 배포 환경을 테스트할 수 있습니다.

## 도구별 비교

| 도구 | 추천 용도 및 특징 |
|------|-------------------|
| [OrbStack](https://orbstack.dev/) | 빠르고 가벼움, Docker와 k8s를 함께 지원하며 리소스 효율적 |
| [Rancher Desktop](https://rancherdesktop.io/) | 올인원 환경: k8s + 컨테이너 런타임 + 편리한 GUI 제공 |
| [minikube](https://minikube.sigs.k8s.io/) | 가장 널리 쓰이는 표준 싱글 노드 로컬 클러스터 |
| [kind](https://kind.sigs.k8s.io/) | Docker 컨테이너 내에서 k8s 노드를 실행하여 CI 유사 환경 테스트에 적합 |

> **추천:** Apple Silicon(M1/M2/M4 등) 기반 Mac Mini에서는 높은 성능과 낮은 리소스 소모를 제공하는 **OrbStack** 또는 사용이 간편한 **Rancher Desktop**을 권장합니다.

---

## OrbStack으로 설치하기

1. [orbstack.dev](https://orbstack.dev/)에서 다운로드하거나 Homebrew로 설치합니다:
   ```bash
   brew install orbstack
   ```
2. OrbStack 실행 → 설정에서 **Kubernetes**를 활성화합니다.
3. 클러스터 동작 확인:
   ```bash
   kubectl get nodes
   ```

---

## Rancher Desktop으로 설치하기

1. [rancherdesktop.io](https://rancherdesktop.io/)에서 설치 파일을 다운로드합니다.
2. 초기 설정 시 컨테이너 런타임으로 **containerd** 또는 **dockerd**를 선택합니다.
3. 설정 완료 후 Kubernetes가 자동으로 시작됩니다.
4. 설치 및 클러스터 상태 확인:
   ```bash
   kubectl get nodes
   kubectl cluster-info
   ```

---

## 자주 사용하는 핵심 kubectl 명령어

```bash
# 클러스터 정보 및 노드 상태 확인
kubectl cluster-info
kubectl get nodes

# 네임스페이스(Namespace) 관리
kubectl get namespaces
kubectl create namespace my-app

# 애플리케이션 배포 및 상태 확인
kubectl apply -f deployment.yaml
kubectl get pods -n my-app
kubectl logs <pod-name> -n my-app

# 포트 포워딩 (로컬에서 서비스 직접 접속)
kubectl port-forward svc/my-service 8080:80 -n my-app

# 리소스 삭제
kubectl delete -f deployment.yaml
```

---

## 샘플 애플리케이션 배포 예제

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      labels:
        app: hello-world
    spec:
      containers:
        - name: hello-world
          image: nginx:alpine
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: hello-world
spec:
  selector:
    app: hello-world
  ports:
    - port: 80
      targetPort: 80
  type: ClusterIP
```

배포 및 확인 방법:
```bash
# 리소스 생성
kubectl apply -f deployment.yaml

# 로컬 포트 포워딩 연결
kubectl port-forward svc/hello-world 8080:80

# 웹 브라우저에서 http://localhost:8080 접속하여 동작 확인
```
