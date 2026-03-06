from fastapi import FastAPI
import socket

app = FastAPI()

@app.get("/")
def home():
    return {
        "message": "FastAPI MIG LoadBalancer",
        "host": socket.gethostname()
    }

@app.get("/health")
def health():
    return {"status": "ok"}