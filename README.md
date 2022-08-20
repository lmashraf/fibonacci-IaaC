# Fibonacci with IaaC

An intentionally complex App with ReactJS, Express and Redis/Postgres designed to view and store inputs of Fibonacci indices using multiple Docker containers to build and deploy to Google Cloud.

For AWS and Beanstalk Deployment, see branch: fibonacci-IaaC-with-AWS

# Kubernetes High-Level Architecture:

```mermaid
flowchart LR;
    Traffic-->Google_Cloud_LoadBalancer
    Google_Cloud_LoadBalancer->LoadBalancer:Deployment_Nginx_Controller;
    Ingress_Config-->LoadBalancer:Deployment_Nginx_Controller;
    LoadBalancer:Deployment_Nginx_Controller-->ClusterIP:Deployment_Client_Pod;
    LoadBalancer:Deployment_Nginx_Controller-->ClusterIP:Deployment_Server_Pod;
    LoadBalancer:Deployment_Nginx_Controller-->ClusterIP:Deployment_Default_Backend_Pod;
    ClusterIP:Deployment_Server_Pod-->ClusterIP:Deployment_Redis_Pod;
    Deployment_Worker_Pod-->ClusterIP:Deployment_Redis_Pod;
    ClusterIP:Deployment_Server_Pod-->ClusterIP:Deployment_Postgres_Pod;
    ClusterIP:Deployment_Postgres_Pod-->Postgres_PVC;
```