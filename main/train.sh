#!/bin/bash

python train.py \
    --gpu 0 --lr 1e-4 \
    --exp_name output/train_setting1 \
    --end_epoch 14 \
    --train_batch_size 8

