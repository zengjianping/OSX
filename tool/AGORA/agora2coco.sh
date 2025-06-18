#!/bin/bash

PATH1=../../dataset/AGORA
PATH2=../../common/utils/human_model_files

python agora2coco.py \
    --dataset_path $PATH1 \
    --human_model_path $PATH2