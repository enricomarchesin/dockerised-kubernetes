#!/bin/bash
cd "${0%/*}"

K3S_VERSION=v0.6.1
# K3S_VERSION=v1.17.4-rc1-k3s1
docker pull rancher/k3s:${K3S_VERSION}
docker save -o k3s-${K3S_VERSION}.tar rancher/k3s:${K3S_VERSION}

K3S_RELEASE=v0.6.1
# K3S_RELEASE=v1.17.4-rc1+k3s1
cd preload
wget https://github.com/rancher/k3s/releases/download/${K3S_RELEASE}/k3s-airgap-images-amd64.tar

docker pull nginx:1.16.0
docker save -o nginx-1.16.0.tar nginx:1.16.0
