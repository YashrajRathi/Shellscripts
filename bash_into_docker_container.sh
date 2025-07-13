#!/bin/bash

echo "Enter container id from the following -"
docker ps
read target_container_id
docker exec -it $target_container_id bash