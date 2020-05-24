# trtmodels

Get model repository:
```
git clone https://github.com/jmduarte/trtmodels
```

Pull docker image for server:
```
docker pull nvcr.io/nvidia/tritonserver:20.03-py3
```

Run server with 1 gpu (#5):
```
nvidia-docker run -e NVIDIA_VISIBLE_DEVICES=5 --rm --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v`pwd`/trtmodels/model_repository:/models nvcr.io/nvidia/tritonserver:20.03-py3 trtserver --model-repository=/models
```

Pull docker image for client:
```
docker pull nvcr.io/nvidia/tritonserver:20.03-py3-clientsdk
```

Run client:
```
docker run -it --rm --net=host nvcr.io/nvidia/tritonserver:20.03-py3-clientsdk
```

Run inference test:
```
perf_client -m particleflow --percentile=95 --input random -i gRPC
```

Meaurement output:
```
*** Measurement Settings ***
  Batch size: 1
  Measurement window: 5000 msec
  Using synchronous calls for inference
  Stabilizing using p95 latency

Request concurrency: 1
  Client: 
    Request count: 559
    Throughput: 111.8 infer/sec
    p50 latency: 9015 usec
    p90 latency: 9695 usec
    p95 latency: 9851 usec
    p99 latency: 10078 usec
    Avg gRPC time: 9035 usec ((un)marshal request/response 18 usec + response wait 9017 usec)
  Server: 
    Request count: 664
    Avg request latency: 8265 usec (overhead 7 usec + queue 69 usec + compute 8189 usec)

Inferences/Second vs. Client p95 Batch Latency
Concurrency: 1, throughput: 111.8 infer/sec, latency 9851 usec
```