#!/bin/bash 
set -euo pipefail

DEPLOY="nginx-web"
TRIVY_NS="trivy-system"
DB_NS="database"
KS_NS="kube-system"

# Checking node resource capacity and usage 
kubectl describe nodes 
kubectl describe node | grep -A5 "Capacity"
kubectl describe node | grep -A5 "Allocatable"

# Deployment logs for trivy-operator  
kubectl get pods -n "$TRIVY_NS"
kubectl get deploy -n "$TRIVY_NS"
kubectl logs -n "$TRIVY_NS" -l app.kubernetes.io/name=trivy-operator
kubectl describe deploy -n "$TRIVY_NS"
kubectl get vulnerabilityreports -n "$KS_NS"

# PostgreSQL database logs and resources 
kubectl get pods -n "$DB_NS"
kubectl describe pods -n "$DB_NS"
kubectl logs -n "$DB_NS" -l app=postgresql


