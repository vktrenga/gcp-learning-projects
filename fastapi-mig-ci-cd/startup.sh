#!/bin/bash

set -e

apt-get update
apt-get install -y git python3-pip python3-venv

cd /opt

git clone https://github.com/vktrenga/gcp-learning-projects.git

cd gcp-learning-projects/fastapi-mig-ci-cd

python3 -m venv venv

venv/bin/pip install -r requirements.txt

nohup venv/bin/python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 &
