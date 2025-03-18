# Create EKS cluster using Terraform

```sh
cd terraform
terraform init
terraform apply
aws eks --region eu-central-1 update-kubeconfig --name new-tf-flagger-traefik
```

# Traefik Installation

[Traefik Installation Guide](https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart)

```sh
helm repo add traefik https://traefik.github.io/charts
helm repo update
kubectl create ns traefik
cd traefik/traefik-2.11.2
helm upgrade --install --namespace=traefik traefik -f ./values.yaml . 
```

# Install Middleware

```sh
cd  traefik
kubectl apply -f default-header-middleware.yaml
```

# Install Cert-Manager

```sh
kubectl create ns cert-manager  
cd cert-manager
helm repo add jetstack https://charts.jetstack.io --force-update
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --values=value.yml
```

# Install Let's Encrypt Issuer

```sh
kubectl apply -f lets-encrypt-issuer.yaml
```

# Setup Certificate

```sh
cd k8-deployment
kubectl create namespace apps
```

**NOTE:** Before creating a certificate, please ensure that the subdomain entry is present at your DNS provider and points to your ALB.

```sh
kubectl apply -f certificate.yml
```

# Install Deployment

```sh
cd k8-deployment
kubectl apply -f images-deployment.yaml
kubectl apply -f video-deployment.yaml
```

# Flagger Deployment 

https://fluxcd.io/flagger/tutorials/traefik-progressive-delivery/

