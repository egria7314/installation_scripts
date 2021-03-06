#!/bin/bash

# Install fission with helm
# helm install --name fission --namespace fission --set serviceType=NodePort,routerServiceType=NodePort https://github.com/fission/fission/releases/download/0.11.0/fission-all-0.11.0.tgz
helm install --name fission --namespace fission --set serviceType=NodePort,routerServiceType=NodePort https://github.com/fission/fission/releases/download/1.0-rc1/fission-all-1.0-rc1.tgz

# Install the Fission CLI
# curl -Lo fission https://github.com/fission/fission/releases/download/0.11.0/fission-cli-linux && chmod +x fission && sudo mv fission /usr/local/bin/
curl -Lo fission https://github.com/fission/fission/releases/download/1.0-rc1/fission-cli-linux && chmod +x fission && sudo mv fission /usr/local/bin/

