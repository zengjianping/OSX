#!/bin/bash

PATH1=../../dataset/AGORA

python tensor_to_numpy_smpl_parameter.py \
    --dataset_path $PATH1 \
    --human_model smpl