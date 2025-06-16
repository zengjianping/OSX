#!/bin/bash
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install openmim
mim install mmcv-full==1.7.1
pip install -r requirements.txt
cd main/transformer_utils && python setup.py install
conda install -y -c conda-forge ffmpeg