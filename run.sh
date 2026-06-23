#!/bin/bash

echo "========================================"
echo " Setting up IDS Project Environment"
echo "========================================"

# 1. Install all required Python packages
echo ">>> Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# 2. Check if the dataset folder already exists. If not, download it.
echo ">>> Checking for dataset..."
if [ ! -d "IDS_test" ]; then
  echo ">>> Downloading the NSL-KDD dataset repository..."
  git clone https://github.com/KostasEreksonas/IDS_test.git
else
  echo ">>> Dataset already exists locally. Skipping download."
fi

echo "========================================"
echo " Setup complete! "
echo " You can now open IDS_Analysis.ipynb"
echo "========================================"
