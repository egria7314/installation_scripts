#!/bin/bash
# Prepare resources used by fission
kubectl apply -f local-storage-class.yaml
kubectl apply -f my-pv.yaml
kubectl apply -f my-pv2.yaml
kubectl apply -f my-pv3.yaml
