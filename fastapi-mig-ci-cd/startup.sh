#!/bin/bash

sudo apt update
sudo apt install -y python3-pip git

cd /home

git clone https://github.com/YOUR_GITHUB_USERNAME/fastapi-mig-project.git

cd fastapi-mig-project

pip3 install -r requirements.txt

nohup uvicorn app.main:app --host 0.0.0.0 --port 80 &