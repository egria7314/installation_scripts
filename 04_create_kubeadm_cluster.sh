#!/bin/bash
# swapoff
sudo swapoff -a
# create kubernetes cluster
sudo sysctl net.bridge.bridge-nf-call-iptables=1
# specify the ip address of master
hostIP=`/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=${hostIP}
#sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.19.16.158
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
kubectl taint nodes --all node-role.kubernetes.io/master-

