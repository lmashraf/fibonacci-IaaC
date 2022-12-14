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

# Ingress
echo "- Applying Ingress configuration ..."
kubectl apply -f ../ingress/

# HTTPS
echo "- Applying HTTPS configuration ..."
kubectl apply -f ../tls/
