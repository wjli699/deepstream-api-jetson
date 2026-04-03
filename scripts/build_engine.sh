#!/bin/bash
trtexec  --onnx=models/peoplenet/peoplenet.onnx  --saveEngine=models/peoplenet/peoplenet.engine  --fp16
