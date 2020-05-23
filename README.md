# trtmodels

Pull docker image:
```
docker pull nvcr.io/nvidia/tritonserver:20.03-py3
```

Get model repository:
```
git clone https://github.com/jmduarte/trtmodels
```

Run triton inference server docker container with 1 gpu (#5):
```
nvidia-docker run -e NVIDIA_VISIBLE_DEVICES=5 --rm --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v`pwd`/trtmodels/model_repository:/models nvcr.io/nvidia/tritonserver:20.03-py3 trtserver --model-repository=/models
```
