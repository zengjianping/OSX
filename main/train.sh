#!/bin/bash

python train.py \
    --gpu 0 --lr 1e-4 \
    --exp_name output/train_osxb \
    --end_epoch 14 \
    --train_batch_size 16 \
    --decoder_setting wo_decoder \
    --encoder_setting osx_b

