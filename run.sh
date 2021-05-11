#!/bin/bash

eval $(minikube -p minikube docker-env)
docker build -t tact-paper-trading .
kubectl apply -f paper-deployment.yaml
kubectl apply -f paper-service.yaml