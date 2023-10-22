# Bitcoin in K8s

Running a Bitcoin node in Kubernetes.

## Prerequisites

* A Kubernetes cluster  (e.g. [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)) with at least 2 CPUs and 4GB of RAM (I think you need wayyy more but double check!)

## Setup

- Docker image built from CI/CD 

### Deploy on K8s

- kubectl create -f k8s/ss.yml
- kubectl create -f k8s/svc.yml
- kubectl create -f k8s/sc.yml
