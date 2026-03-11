from fastapi import FastAPI
import socket

app = FastAPI()

@app.get("/")
def home():
    return {
        "message": "FastAPI MIG LoadBalancer Docker Edited1",
        "host": socket.gethostname(),
        "port":  8000
    }

@app.get("/health")
def health():
    return {"status": "ok", "host": socket.gethostname(), "port": 8000}