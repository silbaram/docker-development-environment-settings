#!/bin/bash

if [ ! -d "/comfyUI/custom_nodes/ComfyUI-Manager" ]; then
    echo "Installing ComfyUI-Manager..."
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git /comfyUI/custom_nodes/ComfyUI-Manager
    pip install --no-cache-dir -r /comfyUI/custom_nodes/ComfyUI-Manager/requirements.txt
fi

# 의존성 복구 로직
if [ ! -f "/comfyUI/.container_started" ]; then
    echo "First start: Running restore-dependencies"
    python custom_nodes/ComfyUI-Manager/cm-cli.py restore-dependencies
    touch /comfyUI/.container_started
else
    echo "Container restarted: Skipping restore-dependencies"
fi

exec python main.py --listen