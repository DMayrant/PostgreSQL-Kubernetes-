# PostgreSQL Database 

PostgreSQL helm chart install 📊

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update 

helm install my-postgresql bitnami/postgresql --version 18.6.2 -n database 
```

# Trivy Scan 

Trivy-operator helm chart 📈

```bash
helm repo add aqua https://aquasecurity.github.io/helm-charts/

helm repo update

helm install my-trivy-operator trivy-operator/trivy-operator --version 0.32.1 -f values.yaml -n trivy-system
```