#!/bin/bash

ls -t /home/yashraj/kube_manifests | grep api | grep server | head -n 10
read target_manifest_file

if [[ -z "$target_manifest_file" ]]; then
  target_manifest_file="kube-apiserver.yaml"
fi

complete_detail_of_kind_container=$(docker ps | grep "kindest/node")
read containerID _ <<< "$complete_detail_of_kind_container"

docker cp /home/yashraj/kube_manifests/$target_manifest_file $containerID:/etc/kubernetes/manifests/kube-apiserver.yaml
