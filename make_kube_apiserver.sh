#!/bin/bash

datetime_stamp=$(date)
echo $datetime_stamp
sed -i "s/The Kubernetes API.*server validates /The Kubernetes API $datetime_stamp hahaha server validates /g" /home/username/kubernetes/cmd/kube-apiserver/app/server.go
cd /home/username/kubernetes && make kube-apiserver
complete_detail_of_kind_container=$(docker ps | grep "kindest/node")
read containerID _ <<< "$complete_detail_of_kind_container"

docker cp /home/username/kubernetes/_output/local/go/bin/kube-apiserver $containerID:/home/kube_binaries/kube-apiserver/kube-apiserver

kubectl delete pod kube-apiserver-kind-control-plane --force