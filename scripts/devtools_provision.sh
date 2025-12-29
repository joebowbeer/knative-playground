#!/bin/bash

echo "[START] Install dev tools"

npm install --global @restatedev/restate@latest

KNATIVE_VERSION=v1.20.0
FUNC_VERSION=v1.20.1

curl -sSL -o kn https://github.com/knative/client/releases/download/knative-$KNATIVE_VERSION/kn-linux-amd64
chmod +x kn
sudo mv kn /usr/local/bin/
# kn version

curl -sSL -o kn-quickstart https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/knative-$KNATIVE_VERSION/kn-quickstart-linux-amd64
chmod +x kn-quickstart
sudo mv kn-quickstart /usr/local/bin/
# kn quickstart --help

curl -sSL -o func https://github.com/knative/func/releases/download/knative-$FUNC_VERSION/func_linux_amd64
chmod +x func
sudo mv func /usr/local/bin/

kind delete cluster -n knative
kn quickstart kind -k 1.35.0 --install-serving --registry

helm upgrade --install restate -n restate --create-namespace --wait \
  oci://ghcr.io/restatedev/restate-helm

echo "[END] Install dev tools"
