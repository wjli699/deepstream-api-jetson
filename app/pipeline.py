import subprocess

process = None

def start_pipeline(rtsp_url):
    global process
    config = "/workspace/app/config/deepstream_app.txt"
    process = subprocess.Popen(["deepstream-app", "-c", config])

def stop_pipeline():
    global process
    if process:
        process.terminate()
