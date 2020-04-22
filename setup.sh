#!/bin/bash
# Downloads the ResNet50_netdef models
mkdir -p model_repository/resnet50_netdef/1
wget -O model_repository/resnet50_netdef/1/model.netdef \
     http://download.caffe2.ai.s3.amazonaws.com/models/resnet50/predict_net.pb
wget -O model_repository/resnet50_netdef/1/init_model.netdef \
     http://download.caffe2.ai.s3.amazonaws.com/models/resnet50/init_net.pb