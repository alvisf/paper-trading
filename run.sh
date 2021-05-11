#!/bin/bash

minikube start

eval $(minikube -p minikube docker-env)
docker build -t tact-paper-trading .
kubectl apply -f paper-deployment.yaml
kubectl apply -f paper-service.yaml

minikube service paper-service --url
minikube service paper-service
