#!/bin/bash

# Wait for system to finish booting for booting
sleep 30

# Update packages
apt-get update -y

# Install Docker
apt-get install -y docker.io

# Start Docker
systemctl daemon-reexec
systemctl start docker
systemctl enable docker

# Wait until Docker is ready
until docker info >/dev/null 2>&1; do
  sleep 5
done

# Authenticate Docker to Artifact Registry
gcloud auth configure-docker us-central1-docker.pkg.dev -q

# Pull Docker image
docker pull us-central1-docker.pkg.dev/first-rank-coders/mig-docker-github-fastapi/fastapi:latest

# Run FastAPI container
docker run -d -p 80:8000 \
--name fastapi-container \
--restart always \
us-central1-docker.pkg.dev/first-rank-coders/mig-docker-github-fastapi/fastapi:latest
