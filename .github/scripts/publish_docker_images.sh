
#!/bin/bash

# Build DEV test image
echo "Build DEV test image to lmachraf/fib-test-dev"
docker build -t lmachraf/fib-test-dev -f ./client/Dockerfile.dev ./client

# Build and publish all PROD docker images individually
echo "Build and Push 'Client' image to lmachraf/fib-client-prod.. "
docker build -t lmachraf/fib-client-prod ./client
docker push lmachraf/fib-client-prod

echo "Build and Push 'Nginx' image to lmachraf/fib-nginx-prod"
docker build -t lmachraf/fib-nginx-prod ./nginx
docker push lmachraf/fib-nginx-prod

echo "Build and Push 'Server' image to lmachraf/fib-server-prod"
docker build -t lmachraf/fib-server-prod ./server
docker push lmachraf/fib-server-prod

echo "Build and Push 'Worker' image to lmachraf/fib-worker-prod"
docker build -t lmachraf/fib-worker-prod ./worker
docker push lmachraf/fib-worker-prod