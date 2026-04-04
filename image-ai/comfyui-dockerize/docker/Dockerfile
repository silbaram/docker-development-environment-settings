# ARG values are defaults. Override them by creating a .env file or using --build-arg
ARG IMAGE_VERSION=2.9.0-cuda13.0-cudnn9-runtime
FROM pytorch/pytorch:${IMAGE_VERSION}
ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1
ENV NVIDIA_VISIBLE_DEVICES=all

ARG MIRROR_URL=""
RUN if [ -n "$MIRROR_URL" ]; then \
    sed -i "s@archive.ubuntu.com@$MIRROR_URL@g" /etc/apt/sources.list; \
    fi

RUN apt update && \
    apt -y install git libgl1-mesa-glx libglib2.0-0 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /comfyUI

ARG COMFYUI_VERSION=v0.3.29

RUN git clone --branch ${COMFYUI_VERSION} https://github.com/comfyanonymous/ComfyUI.git . && \
    pip install --no-cache-dir -r requirements.txt

COPY startup.sh .
RUN chmod +x ./startup.sh
RUN sed -i 's/\r$//' ./startup.sh 

ENTRYPOINT [ "./startup.sh" ]