#!/bin/bash

datetime_stamp=$(date +"%Y%m%d%H%M%S")

complete_detail_of_kind_container=$(docker ps | grep "kindest/node")
read containerID _ <<< "$complete_detail_of_kind_container"
docker cp $containerID:/etc/kubernetes/manifests/kube-apiserver.yaml /home/yashraj/kube_manifests/kube-apiserver-$datetime_stamp.yaml
cp /home/yashraj/kube_manifests/kube-apiserver-$datetime_stamp.yaml /home/yashraj/kube_manifests/kube-apiserver.yaml

code -n /home/yashraj/kube_manifests/kube-apiserver.yaml

