#!/bins/bash
echo "Waiting 10s for cluster to initialise..."
sleep 10

mkdir -p /root/.config/k3d/k3d/
export KUBECONFIG="$(k3d get-kubeconfig --name='k3d')"
source <(kubectl completion bash)

/setup/ttyd -p 8022 bash
