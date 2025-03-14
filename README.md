# Traefik Installation

https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart

helm repo add traefik https://traefik.github.io/charts

helm repo update

kubectl create ns traefik 

helm install --namespace=traefik traefik traefik/traefik


eksctl create iamserviceaccount \
  --name my-service-account \
  --namespace default \
  --cluster tf-flagger \
  --region eu-central-1 \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy \
  --approve