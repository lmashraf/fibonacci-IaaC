#!/bin/bash

# Show current running Deployments, Service ands Pods
echo "- Deployments:"
kubectl get deployment

echo "- Services:"
kubectl get service

echo "- Pods:"
kubectl get pod