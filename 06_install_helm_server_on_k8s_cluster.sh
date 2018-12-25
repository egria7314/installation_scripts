#!/bin/bash
# install the Helm server on your Kubernetes cluster
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller
#or
#$ helm init
helm init --service-account tiller --upgrade

