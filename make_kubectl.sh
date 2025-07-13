#!/bin/bash

this_date=$(date)
sed -i "s/kubectl.*controls the Kubernetes cluster manager/kubectl $this_date controls the Kubernetes cluster manager/g" /home/yashraj/kubernetes/staging/src/k8s.io/kubectl/pkg/cmd/cmd.go
cd /home/yashraj/kubernetes && make kubectl
cp /home/yashraj/kubernetes/_output/local/bin/linux/amd64/kubectl /usr/local/bin/kubectl 