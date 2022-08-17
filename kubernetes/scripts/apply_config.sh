#!/bin/bash

# Client
echo "- Applying Client k8s configuration ..."
kubectl apply -f ../client/

# Server
echo "- Applying Client k8s configuration ..."
kubectl apply -f ../server/

# Worker
echo "- Applying Client k8s configuration ..."
kubectl apply -f ../worker/