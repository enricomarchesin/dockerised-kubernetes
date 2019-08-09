#!/bins/bash
echo "Waiting 10s for cluster to initialise..."
sleep 10

mkdir -p /root/.config/k3d/k3d/
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

# /setup/vnc.sh

ttyd -p 8022 bash
