# Create EKS cluster using terraform 
    cd terraform 
    terraform init
    terraform apply
    aws eks --region eu-central-1 update-kubeconfig --name new-tf-flagger-traefik
# Traefik Installation

    https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart
    helm repo add traefik https://traefik.github.io/charts
    helm repo update
    kubectl create ns traefik 
    cd traefik  
    helm upgrade --install --namespace=traefik traefik -f value.yaml traefik/traefik
# -- Install middleware --
    kubectl apply -f default-header-middleware.yaml 

### --- install cert manager
    kubectl create ns cert-manager  
    cd cert-manager 
    helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --values=value.yml
    kubectl apply -f  default-header-middleware.yaml

# -- setup certificate 
    cd k8-deployment 
    kubectl create namespace apps

## NOTE: Before creating certificate please make sure subdomain entry should be preset at dns provider which need to point your ALB ##

    kubectl apply -f certificate.yml 

# -- Install deployment 
    cd k8-deployment
    kubectl apply -f images-deployment.yaml
    kubectl apply -f video-deployment.yaml  
