# deepstream-api-jetson

DeepStream + FastAPI backend for Jetson Orin NX.



## Features

-   RTSP camera ingestion
-   NVIDIA PeopleNet detection
-   Multi-object tracking
-   Line crossing analytics
-   Zone dwell time analytics
-   JSON metadata for backend integration

Target: Jetson Orin NX (JetPack 6.x)

## Repository Structure

``` 
deepstream-api-jetson/
│
├── README.md
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── app/
│   ├── main.py
│   ├── pipeline.py
│   ├── model_manager.py
│   └── config/
│       ├── deepstream_app.txt
│       ├── pgie_peoplenet.txt
│       ├── tracker_config.yml
│       └── analytics_config.txt
│
├── models/
│   └── peoplenet/
│
└── scripts/
    ├── jetson_check.sh
    └── build_engine.sh
``` 

------------------------------------------------------------------------

## 1. Hardware Requirements

-   Jetson Orin NX (16GB recommended)
-   NVMe SSD recommended
-   25W or MAXN power mode

------------------------------------------------------------------------

## 2. Fresh Jetson Setup

Flash using NVIDIA SDK Manager:

-   JetPack 6.x
-   Ubuntu 22.04

Verify installation:

``` bash
cat /etc/nv_tegra_release
```

------------------------------------------------------------------------

## 3. Set Performance Mode

``` bash
sudo nvpmodel -m 0
sudo jetson_clocks
```

------------------------------------------------------------------------

## 4. Validate Software Stack

``` bash
bash scripts/jetson_check.sh
```

------------------------------------------------------------------------

## 5. Build and Run Container

``` bash
docker compose build
docker compose up
```

------------------------------------------------------------------------

## 6. Start Pipeline

POST request:

    POST /start
    Body: { "rtsp_url": "rtsp://camera_ip/stream" }

------------------------------------------------------------------------

## 7. Model Management

Place models in:

    models/peoplenet/

Build TensorRT engine on device:

``` bash
bash scripts/build_engine.sh
```

Always build engines on the target Jetson device.

------------------------------------------------------------------------

## 8. Performance Target (Orin NX 25W)

```
  Streams   Expected FPS
  --------- -----------------
  1         30+ FPS
  4         30 FPS each
  8         15--20 FPS each
```

Use FP16 for stable deployment.
