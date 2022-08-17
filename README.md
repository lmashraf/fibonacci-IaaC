# Fibonacci with IaaC

An intentionally complex App with ReactJS, Express and Redis/Postgres designed to view and store inputs of Fibonacci indices using multiple Docker containers to build and deploy to Amazon Elastic Beanstalk.

see branch: fibonacci-IaaC-with-AWS

# Kubernetes High Level Architecture:

```mermaid
flowchart LR;
    Traffic-->Ingress_Service;
    Ingress_Service-->ClusterIP:Deployment_Client_Pod;
    Ingress_Service-->ClusterIP:Deployment_Server_Pod;
    ClusterIP:Deployment_Server_Pod-->ClusterIP:Deployment_Redis_Pod;
    Deployment_Worker_Pod-->ClusterIP:Deployment_Redis_Pod;
    ClusterIP:Deployment_Server_Pod-->ClusterIP:Deployment_Postgres_Pod;
    ClusterIP:Deployment_Postgres_Pod-->Postgres_PVC;
```
