from fastapi import FastAPI
from app.pipeline import start_pipeline, stop_pipeline

app = FastAPI()

@app.post("/start")
def start(rtsp_url: str):
    start_pipeline(rtsp_url)
    return {"status": "started"}

@app.post("/stop")
def stop():
    stop_pipeline()
    return {"status": "stopped"}
