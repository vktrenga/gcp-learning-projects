from fastapi import FastAPI
import socket

app = FastAPI()

@app.get("/")
def home():
    return {
        "message": "FastAPI MIG LoadBalancer",
        "host": socket.gethostname(),
        "port":  8000
    }

@app.get("/health")
def health():
    return {"status": "ok"}