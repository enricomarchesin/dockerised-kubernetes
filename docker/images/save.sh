#!/bin/bash
cd "${0%/*}"

docker pull rancher/k3s:v0.6.1
docker save -o k3s-v0.6.1.tar rancher/k3s:v0.6.1

cd preload

wget https://github.com/rancher/k3s/releases/download/v0.6.1/k3s-airgap-images-amd64.tar

docker pull nginx:1.16.0
docker save -o nginx-1.16.0.tar nginx:1.16.0
