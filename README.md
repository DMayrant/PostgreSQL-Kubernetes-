# AWS EKS PostgreSQL Deployment & Troubleshooting Lab

This project demonstrates deploying and troubleshooting a PostgreSQL database running on Amazon EKS using Helm, persistent storage, and Kubernetes operational workflows commonly used in production cloud environments.

---

## Overview

This lab focuses on:

- Amazon Elastic Kubernetes Service (EKS)
- Helm-based PostgreSQL deployment
- Kubernetes persistent storage
- Pod scheduling analysis
- Kubernetes event troubleshooting
- Container log analysis
- Service discovery validation
- Cloud-native operations

---

## Architecture

```text
                     AWS Cloud
                          │
                          ▼
                 ┌────────────────┐
                 │ Amazon EKS     │
                 │ Control Plane  │
                 └───────┬────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ EKS Worker Nodes │
                └────────┬─────────┘
                         │
         ┌───────────────┴──────────────┐
         ▼                              ▼

 ┌─────────────────┐           ┌─────────────────┐
 │ PostgreSQL Pod  │           │ NGINX Web Pod   │
 └────────┬────────┘           └────────┬────────┘
          │                             │
          ▼                             ▼

 ┌─────────────────┐           ┌─────────────────┐
 │ Kubernetes PVC  │           │ Kubernetes SVC  │
 └────────┬────────┘           └─────────────────┘
          │
          ▼

 ┌─────────────────┐
 │ Amazon EBS      │
 │ Persistent Disk │
 └─────────────────┘
```

---

## Technologies

- AWS EKS
- Kubernetes
- Helm
- PostgreSQL
- Amazon EBS CSI Driver
- Docker
- kubectl
- VS Code

---

## Deployment

### Create EKS Cluster

```bash
eksctl create cluster \
  --name postgres-lab \
  --region us-east-1 \
  --nodes 2
```

### Verify Cluster

```bash
kubectl get nodes
```

### Install EBS CSI Driver

```bash
eksctl create addon \
  --name aws-ebs-csi-driver \
  --cluster postgres-lab \
  --force
```

### Add Helm Repository

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

### Deploy PostgreSQL

```bash
helm install my-postgresql bitnami/postgresql
```

---

## Validation

### Verify Pods

```bash
kubectl get pods
```

### Verify PVC

```bash
kubectl get pvc
```

### Verify StorageClass

```bash
kubectl get storageclass
```

### View Logs

```bash
kubectl logs my-postgresql-0
```

### View Events

```bash
kubectl describe pod my-postgresql-0
```

---

## Troubleshooting Scenarios

### Unbound PersistentVolumeClaim

Observed:

```text
persistentvolumeclaims not found
```

Investigation:

```bash
kubectl get pvc
kubectl describe pvc
kubectl get storageclass
```

Resolution:

- Verified EBS CSI Driver installation
- Confirmed StorageClass configuration
- Recreated PVC after validating EBS provisioning

---

### Pod Scheduling Failure

Observed:

```text
FailedScheduling
```

Investigation:

```bash
kubectl describe pod
kubectl get events
```

Resolution:

- Verified node capacity
- Validated PVC binding
- Reviewed taints and tolerations

---

### PostgreSQL Startup Validation

Investigation:

```bash
kubectl logs my-postgresql-0
```

Validated:

- PostgreSQL initialization
- Authentication configuration
- Database readiness
- EBS volume attachment

---

## Operational Commands

### Get Pods

```bash
kubectl get pods -A
```

### Get Events

```bash
kubectl get events \
--sort-by=.metadata.creationTimestamp
```

### Describe Pod

```bash
kubectl describe pod my-postgresql-0
```

### Connect to PostgreSQL

```bash
kubectl exec -it my-postgresql-0 -- bash
```

---

## Skills Demonstrated

- AWS EKS Administration
- Kubernetes Troubleshooting
- Helm Package Management
- Persistent Storage Management
- Amazon EBS CSI Driver
- Container Log Analysis
- Stateful Application Deployment
- Cloud Infrastructure Operations
- Platform Engineering

---

## Business Outcome

Implemented a production-style PostgreSQL deployment on Amazon EKS while validating storage provisioning, pod scheduling, and application startup workflows. Demonstrated the ability to troubleshoot common Kubernetes operational issues involving PVCs, storage classes, container logs, and workload scheduling.

---

## Author

Devonne Mayrant

Cloud Platform Engineer | DevSecOps Engineer | AWS

GitHub:
https://github.com/DMayrant