# Install CUDA 12.6

# Check If CUDA is not 12.6 
if [ "$(dpkg -l | grep cuda-toolkit-12-6)" -eq 0 ]; then
    echo "CUDA 12.6 is already installed"
else
    # If *.deb file is not found, download it
    if [ ! -f "cuda-repo-ubuntu2204-12-6-local_12.6.1-560.35.03-1_amd64.deb" ]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
        sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.6.1/local_installers/cuda-repo-ubuntu2204-12-6-local_12.6.1-560.35.03-1_amd64.deb
    fi
    sudo dpkg -i cuda-repo-ubuntu2204-12-6-local_12.6.1-560.35.03-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2204-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
    sudo apt-get update
    sudo apt-get -y install cuda-toolkit-12-6
fi


# Check if CUDA is already in FISH path
if ! fish -c 'echo $fish_user_paths' | grep -q "/usr/local/cuda-12.6/bin"; then
    echo "Adding CUDA to FISH path"
    fish_add_path /usr/local/cuda-12.6/bin
else
    echo "CUDA is already in FISH path"
fi


# NVIDIA Driver
sudo apt-get install -y nvidia-open
sudo apt-get install -y cuda-drivers