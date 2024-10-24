#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y python3.10 python3.10-dev python3.10-venv python3-pip

wget https://developer.download.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
chmod +x cuda_8.0.61_375.26_linux-run
sudo ./cuda_8.0.61_375.26_linux-run --override --silent --toolkit

echo 'export PATH=/usr/local/cuda-8.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

python3.8 -m venv pytorch-venv
source pytorch-venv/bin/activate

pip install torch==0.4.0 -f https://download.pytorch.org/whl/cu80/stable

echo "Installation completed. PyTorch 0.4.0 with CUDA 8.0 is set up with Python 3.8."
