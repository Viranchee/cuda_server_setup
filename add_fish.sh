# If fish is already installed, skip the installation
if ! command -v fish &> /dev/null; then
    sudo apt-add-repository ppa:fish-shell/release-3 -y
    sudo apt update
    sudo apt install fish -y
fi

exec fish

# TODO: Sync fish config and setup from my dotfiles repo.