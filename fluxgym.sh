#!/bin/bash

# Update package lists and install necessary packages
apt-get update -y
apt-get install -y git python3-venv

# Clone the FluxGym repository
git clone https://github.com/cocktailpeanut/fluxgym.git
cd fluxgym

# Clone the sd-scripts repository within the fluxgym directory
git clone -b sd3 https://github.com/kohya-ss/sd-scripts.git

# Set up a Python virtual environment
python3 -m venv env
source env/bin/activate

# Install dependencies for sd-scripts
cd sd-scripts
pip install -r requirements.txt

# Return to the fluxgym directory
cd ..

# Install FluxGym dependencies
pip install -r requirements.txt

# Install PyTorch Nightly with CUDA 12.1 support
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu121

# Deactivate the virtual environment
deactivate

# Print completion message
echo "FluxGym installation completed successfully."
