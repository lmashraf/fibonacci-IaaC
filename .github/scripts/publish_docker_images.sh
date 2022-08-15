
#!/bin/bash

# Client
echo "Build and Push 'Client' image to lmachraf/fib-client-prod.. "
docker build -t lmachraf/fib-client-prod ./client
docker push lmachraf/fib-client-prod

# Nginx
echo "Build and Push 'Nginx' image to lmachraf/fib-nginx-prod"
docker build -t lmachraf/fib-nginx-prod ./nginx
docker push lmachraf/fib-nginx-prod

# Server
echo "Build and Push 'Server' image to lmachraf/fib-server-prod"
docker build -t lmachraf/fib-server-prod ./server
docker push lmachraf/fib-server-prod

# Worker
echo "Build and Push 'Worker' image to lmachraf/fib-worker-prod"
docker build -t lmachraf/fib-worker-prod ./worker
docker push lmachraf/fib-worker-prod