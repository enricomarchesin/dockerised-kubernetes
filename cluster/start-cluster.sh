#!/bins/bash
docker load --input /setup/images/k3s-v0.6.1.tar

k3d create --image rancher/k3s:v0.6.1 --api-port docker:6443 --publish 8081:80 --name k3d --workers $WORKERS -v /preload:/var/lib/rancher/k3s/agent/images

echo "Waiting 5s for cluster to initialise..."
sleep 5

export KUBECONFIG="$(k3d get-kubeconfig --name='k3d')"
source <(kubectl completion bash)

kubectl create ns lb
kubectl -n lb create deployment nginx --image=nginx:1.16.0
kubectl -n lb create service clusterip nginx --tcp=80:80
kubectl -n lb apply -f ingress.yml

# /setup/vnc.sh

ttyd -p 8022 bash
