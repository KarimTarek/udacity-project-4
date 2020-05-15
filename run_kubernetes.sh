#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=k4r1m/housing-market-app-udacity

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run housingmarketapp --image=k4r1m/housing-market-app-udacity:1.0 --port=80

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl expose deployment housingmarketapp --port=8000 --target-port=80
kubectl port-forward deployment/housingmarketapp 8000:80