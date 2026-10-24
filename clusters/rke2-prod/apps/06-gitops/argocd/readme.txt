# 1. Create the Argo CD namespace
kubectl create namespace argocd

# 2. Install Argo CD CRDs + controller (manual one‑time bootstrap)
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 3. Verify pods are running
kubectl get pods -n argocd

# 4. Apply your GitOps-managed Argo CD Application
# (this lives in your repo under apps/06-gitops/argocd/argocd-app.yaml)
kubectl apply -f apps/06-gitops/argocd/argocd-app.yaml -n argocd

# 5. Wait until Argo CD reconciles itself
kubectl get pods -n argocd

# 6. Apply your ApplicationSet for the cluster apps
# (this lives in your repo as rke2-cluster-appset.yaml)
kubectl apply -f clusters/rke2-prod/rke2-cluster-appset.yaml -n argocd

# 7. Verify Applications are generated
kubectl get applications -n argocd

