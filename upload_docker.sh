#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=k4r1m/housing-market-app-udacity

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username=k4r1m
# Step 3:
# Push image to a docker repository
docker tag housingmarketapp:latest k4r1m/housing-market-app-udacity:1.0
docker push k4r1m/housing-market-app-udacity:1.0
