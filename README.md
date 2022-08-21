# Fibonacci with IaaC

An intentionally complex App with ReactJS, Express and Redis/Postgres designed to view and store inputs of Fibonacci indices using multiple Docker containers to build and deploy to Google Cloud.

- [fibonacci-IaaC-with-AWS](https://github.com/lmashraf/fibonacci-IaaC/tree/fibonacci-IaaC-with-AWS): Deployment to AWS using Elastic Beanstalk with Docker-Compose.
- [fibonacci-IaaC-local-k8s](https://github.com/lmashraf/fibonacci-IaaC/tree/fibonacci-IaaC-local-k8s|): Deployment locally with minikube.
- [master](https://github.com/lmashraf/fibonacci-IaaC/): Deployment to Google Cloud with Kubernetes.

# High-Level Architecture:

```mermaid
flowchart LR;
    A[Traffic] --> B[ Google Cloud\n Load Balancer];
    B --> C[ LoadBalancer\n-\nDeployment: Nginx Controller]
    I[ Deployment: Worker Pod] --> H    
    C --> F[ Cluster IP\n-\nDeployment: Server Pod]
    F --> J[Cluster IP\n-\nDeployment: Postgres Pod]
    J --> K[Persistent Volume Claim:\n-\n Postgres]
    C --> E[ Cluster IP\n-\nDeployment: Client Pod]
    C --> G[ Cluster IP\n-\nDeployment: Default Backend Pod]
    D[ Ingress Config] --> C
    F --> H[Cluster IP\n-\nDeployment: Redis Pod]
```

# How To Deploy to Google Cloud:

## Prerequisites:

- Google Cloud account: https://cloud.google.com/free

## Steps:

TBD