FROM nvcr.io/nvidia/deepstream:6.4-triton-multiarch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y     python3-pip     python3-dev     git     curl     && rm -rf /var/lib/apt/lists/*

RUN pip3 install fastapi uvicorn pydantic opencv-python

WORKDIR /workspace

COPY app /workspace/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
