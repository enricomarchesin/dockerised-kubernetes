#!/bins/bash
# /etc/init.d/docker start

curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash
k3d create --auto-restart --publish 80 --name k3d
# -v /var/lib/docker:/var/lib/docker -v /var/lib/rancher:/var/lib/rancher
# --workers 2
export KUBECONFIG="$(k3d get-kubeconfig --name='k3d')"
source <(kubectl completion bash)

# kubectl create deployment nginx --image=nginx
# kubectl create service clusterip nginx --tcp=80:80
# kubectl apply -f ingress.yml

/setup/ttyd -p 8022 bash
