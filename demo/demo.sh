#!/bin/bash

#MODEL_PATH="../pretrained_models/osx_l.pth.tar"
MODEL_PATH="../output/train_agora/model_dump/snapshot_13.pth.tar"

python demo.py \
    --decoder_setting="normal" \
    --encoder_setting="osx_b" \
    --pretrained_model_path=$MODEL_PATH \
    --img_path="input.png" \
    --output_folder="output"

