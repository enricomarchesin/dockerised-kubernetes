#!/bins/bash
K3S_VERSION=v0.6.1
# K3S_VERSION=v1.17.4-rc1-k3s1

docker load --input /setup/images/k3s-${K3S_VERSION}.tar
k3d create --image rancher/k3s:${K3S_VERSION} --api-port docker:6443 --publish 8081:80 --name k3d --workers $WORKERS -v /preload:/var/lib/rancher/k3s/agent/images

echo "Waiting 5s for cluster to initialise..."
sleep 5

export KUBECONFIG="$(k3d get-kubeconfig --name='k3d')"

COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
ln -sf ~/.kubectx/completion/kubens.bash $COMPDIR/kubens
ln -sf ~/.kubectx/completion/kubectx.bash $COMPDIR/kubectx
cat << FOE >> ~/.bashrc

source /etc/bash_completion

#kubectl
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

#kubectx and kubens
export PATH=~/.kubectx:\$PATH
FOE

kubectl create ns lb
kubectl -n lb create deployment nginx --image=nginx:1.16.0
kubectl -n lb create service clusterip nginx --tcp=80:80
kubectl -n lb apply -f ingress.yml

kubectl create ns ns1
kubectl create ns ns2
kubectl create ns ns3
kubectl create ns ns4
kubectl create ns ns5
kubectl create ns ns6
kubectl create ns ns7
kubectl create ns ns8
kubectl create ns ns9
kubectl create ns ns10
kubectl create ns ns11
kubectl create ns ns12
kubectl create ns ns13
kubectl create ns ns14
kubectl create ns ns15
kubectl create ns ns16
kubectl create ns ns17
kubectl create ns ns18
kubectl create ns ns19
kubectl create ns ns20

# /setup/vnc.sh

export PYTHONIOENCODING=utf-8

ttyd -p 8022 bash
