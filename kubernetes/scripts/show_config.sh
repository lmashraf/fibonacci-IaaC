#!/bin/bash

# Show current running Deployments, Service ands Pods
echo "- Deployments:"
kubectl get deployment

echo "- Services:"
kubectl get service

echo "- Pods:"
kubectl get pod

echo "- Persistent Volumes:"
kubectl get pv

echo "- Persistent Volume Claims:"
kubectl get pvc