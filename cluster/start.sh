#!/bins/bash
k3d create --api-port docker:6443 --publish 80 --name k3d --workers 1
sleep 5
export KUBECONFIG="$(k3d get-kubeconfig --name='k3d')"
source <(kubectl completion bash)

kubectl create deployment nginx --image=nginx
kubectl create service clusterip nginx --tcp=80:80
kubectl apply -f ingress.yml

/setup/ttyd -p 8022 bash
