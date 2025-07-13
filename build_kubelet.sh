#!/bin/bash

date_tag=$(date)

sed -i "s/The kubelet is the primary.*that runs on each/The kubelet is the primary $date_tag that runs on each/g" /home/yashraj/kubernetes/cmd/kubelet/app/server.go

cd /home/yashraj/kubernetes && make kubelet
complete_detail_of_kind_container=$(docker ps | grep "kindest/node")
read containerID _ <<< "$complete_detail_of_kind_container"

docker cp /home/yashraj/kubernetes/_output/local/bin/linux/amd64/kubelet $containerID:/usr/bin/kubelet