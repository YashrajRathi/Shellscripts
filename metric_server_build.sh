#!/bin/bash

docker_tag=$(date +"%Y%m%d%H%M%S")
cd /home/username/metrics-server && cp -r /home/username/kubernetes/staging/src/k8s.io ./ && docker build -t metric_server:$docker_tag -f Dockerfile . 
build_container_id=$(docker run -d metric_server:$docker_tag bash -c "sleep  1000")
docker cp $build_container_id:/go/src/sigs.k8s.io/metrics-server/metrics-server .
echo "Killing docker container of $build_container_id"
docker kill $build_container_id
docker container rm $build_container_id
docker image rm -f metric_server:$docker_tag 
complete_detail_of_kind_container=$(docker ps | grep "kindest/node")
read containerID _ <<< "$complete_detail_of_kind_container"
docker cp /home/username/metrics-server/metrics-server $containerID:/home/kube_binaries/metrics-server/metrics-server
rm /home/username/metrics-server/metrics-server
kubectl rollout restart deployment metrics-server