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

# Redis
echo "- Applying Redis k8s configuration ..."
kubectl apply -f ../redis/

# Postgres
echo "- Applying Postgres k8s configuration ..."
kubectl apply -f ../postgres/
