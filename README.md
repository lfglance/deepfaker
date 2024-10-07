## deepfaker

Small PoC of [deep-live-cam](https://github.com/hacksider/Deep-Live-Cam) as a distributable Docker image for creating deepfakes (face swaps).

Requires an Nvidia based GPU and Nvidia container toolkit package: [nvidia-container-tool amd64](https://github.com/NVIDIA/nvidia-container-toolkit/releases/download/v1.16.2/nvidia-container-toolkit_1.16.2_deb_amd64.tar.gz)

### Usage

Build the image:

```bash
docker build -t deep-live-cam .
```

Running the script with no arguments presents a GUI.

```bash
bash run.sh
```

Running the script with arguments will pass them to the main run script.

```bash
bash run.sh --help
...
usage: run.py [-h] [-s SOURCE_PATH] [-t TARGET_PATH] [-o OUTPUT_PATH] [--frame-processor {face_swapper,face_enhancer} [{face_swapper,face_enhancer} ...]] [--keep-fps] [--keep-audio] [--keep-frames] [--many-faces]
              [--nsfw-filter] [--map-faces] [--video-encoder {libx264,libx265,libvpx-vp9}] [--video-quality [0-51]] [--live-mirror] [--live-resizable] [--max-memory MAX_MEMORY]
              [--execution-provider {tensorrt,cuda,azure,cpu} [{tensorrt,cuda,azure,cpu} ...]] [--execution-threads EXECUTION_THREADS] [-v]
...

bash run.sh --version
...
Deep Live Cam 1.5.0
```

Use directories `input` and `output` to store files as those are mapped as volumes within the container image. When launching the GUI or running the terminal only script make sure the files you want to use are in those folders.

```bash
bash run.sh -s input/chuck_norris.png -t input/lfglance.png -o output/lance_norris.png
...
```