#!/bin/bash

apt update
apt install -y python3-pip git

git clone https://github.com/vktrenga/gcp-learning-projects.git

cd gcp-learning-projects/fastapi-mig-ci-cd

pip3 install -r requirements.txt

nohup uvicorn main:app --host 0.0.0.0 --port 8000 &