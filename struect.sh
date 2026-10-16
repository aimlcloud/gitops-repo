#!/bin/bash

# Base cluster path
BASE_DIR="clusters/rke2-prod"

# Create main directories
mkdir -p $BASE_DIR/apps \
         $BASE_DIR/values

# Networking
mkdir -p $BASE_DIR/apps/00-networking/{calico,coredns,metallb}

# Ingress + TLS
mkdir -p $BASE_DIR/apps/01-ingress-tls/{ingress-nginx,cert-manager}

# Observability
mkdir -p $BASE_DIR/apps/02-observability/{prometheus-stack,grafana,loki,alloy}

# Security
mkdir -p $BASE_DIR/apps/03-security/{falco,trivy-operator,kyverno,kube-bench}

# Storage
mkdir -p $BASE_DIR/apps/04-storage/{longhorn,velero}

# Identity + Secrets
mkdir -p $BASE_DIR/apps/05-identity-secrets/{keycloak,external-secrets}

# GitOps
mkdir -p $BASE_DIR/apps/06-gitops/argocd

# Audit
mkdir -p $BASE_DIR/apps/07-audit/audit-logs

# Values files placeholders
touch $BASE_DIR/values/{calico-values.yaml,coredns-values.yaml,metallb-values.yaml,\
ingress-nginx-values.yaml,cert-manager-values.yaml,prometheus-stack-values.yaml,\
grafana-values.yaml,loki-values.yaml,alloy-values.yaml,falco-values.yaml,\
trivy-operator-values.yaml,kyverno-values.yaml,kube-bench-values.yaml,\
longhorn-values.yaml,velero-values.yaml,keycloak-values.yaml,\
external-secrets-values.yaml,argocd-values.yaml,audit-logs-values.yaml}

# Apps-of-apps manifest placeholder
touch $BASE_DIR/apps-of-apps.yaml

echo "✅ GitOps repo structure created under $BASE_DIR"

