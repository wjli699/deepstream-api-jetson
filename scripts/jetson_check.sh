#!/bin/bash
echo "==== Jetson Info ===="
uname -a
cat /etc/nv_tegra_release

echo "==== CUDA ===="
nvcc --version || echo "CUDA not found"

echo "==== TensorRT ===="
dpkg -l | grep nvinfer

echo "==== DeepStream ===="
dpkg -l | grep deepstream

echo "==== Power Mode ===="
sudo nvpmodel -q
