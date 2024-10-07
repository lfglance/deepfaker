#!/bin/bash

XSOCK=/tmp/.X11-unix
CAM=/dev/video0

docker run -it --rm \
  --gpus all \
  -e HOST_USER=$(id -u) \
  -e HOST_GROUP=$(id -g) \
  -e HOST_USER_NAME=$(whoami) \
  -e DISPLAY=$DISPLAY \
  --device $CAM \
  -v $XSOCK:$XSOCK \
  -v ./input:/app/input \
  -v ./output:/app/output \
  deep-live-cam:latest \
  $@
