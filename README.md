# PostgreSQL ☸️

This project deploys an NGINX application on Amazon EKS with a PostgreSQL backend for structured data and log storage using Helm charts. Trivy image scanning was integrated into the environment to identify critical container vulnerabilities before workloads are promoted into production-style deployments.

# Infrastructure 🏗️

- Amazon EKS cluster

- NGINX application deployment

- PostgreSQL database deployment using Helm charts

- Trivy security scanning for container image vulnerability detection

- Test pod for internal service discovery and Kubernetes troubleshooting

- Kubernetes LoadBalancer service for external application access