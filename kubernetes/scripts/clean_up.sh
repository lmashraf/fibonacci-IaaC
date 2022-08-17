#!/bin/bash

# Delete deployments
echo "- Deleting k8s deployments ..."
kubectl delete deployment $(kubectl get deployment | awk '{if (NR !=1) {print $1}}')

# Delete services
echo "- Deleting k8s services ..."
kubectl delete service $(kubectl get service | awk '{if (NR !=1) {print $1}}')

# Delete pods
echo "- Deleting k8s pods ..."
kubectl delete pod $(kubectl get pod | awk '{if (NR !=1) {print $1}}')

# Show current running deployments, service ands pods
./show_config.sh