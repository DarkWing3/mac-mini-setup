---
layout: default
title: Mini Kubernetes Setup
---

# Mini Kubernetes (k8s) for Development

[← Home](index.md)

A lightweight local Kubernetes cluster on your Mac Mini — great for testing deployments without cloud costs.

## Options

| Tool | Best For |
|------|----------|
| [Rancher Desktop](https://rancherdesktop.io/) | All-in-one: k8s + container runtime + GUI |
| [OrbStack](https://orbstack.dev/) | Fast, lightweight, Docker + k8s |
| [minikube](https://minikube.sigs.k8s.io/) | Standard single-node cluster |
| [kind](https://kind.sigs.k8s.io/) | k8s in Docker, great for CI-like testing |

> **Recommendation:** OrbStack or Rancher Desktop for ease of use on Apple Silicon.

---

## Install with OrbStack

1. Download OrbStack from [orbstack.dev](https://orbstack.dev/) or via Homebrew:
   ```bash
   brew install orbstack
   ```
2. Open OrbStack → enable **Kubernetes** in settings.
3. Verify:
   ```bash
   kubectl get nodes
   ```

---

## Install with Rancher Desktop

1. Download from [rancherdesktop.io](https://rancherdesktop.io/)
2. During setup, select **containerd** or **dockerd** as the container runtime.
3. Kubernetes starts automatically.
4. Verify:
   ```bash
   kubectl get nodes
   kubectl cluster-info
   ```

---

## Essential kubectl Commands

```bash
# Cluster info
kubectl cluster-info
kubectl get nodes

# Namespaces
kubectl get namespaces
kubectl create namespace my-app

# Deploy
kubectl apply -f deployment.yaml
kubectl get pods -n my-app
kubectl logs <pod-name> -n my-app

# Port forward (access a service locally)
kubectl port-forward svc/my-service 8080:80 -n my-app

# Delete
kubectl delete -f deployment.yaml
```

---

## Sample Deployment

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

Apply it:
```bash
kubectl apply -f deployment.yaml
kubectl port-forward svc/hello-world 8080:80
# Open http://localhost:8080
```
