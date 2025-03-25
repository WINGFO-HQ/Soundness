#!/bin/bash

echo "WINGFO Soundness Labs Installation..."

echo "Creating directory for keys..."
mkdir -p ./soundness_keys

echo "Please enter a name for your key:"
read KEY_NAME

mkdir -p ./soundness_keys/$KEY_NAME

echo "Installing soundnessup..."
curl -sSL https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/install | bash

echo "Sourcing bashrc and profile..."
source ~/.bashrc
source ~/.profile
export PATH=$PATH:$HOME/.soundness/bin

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

echo "Installing Soundness CLI..."
soundnessup install

export PATH=$PATH:$HOME/.soundness/bin

if ! command -v soundness-cli &> /dev/null; then
    echo "ERROR: soundness-cli command not found. Please check installation."
    echo "Try running this command manually after installation: export PATH=\$PATH:\$HOME/.soundness/bin"
    exit 1
fi

echo "Generating Soundness key with name: $KEY_NAME"
echo ""
echo 'NOTE: When prompted for password, your typing will be invisible (no asterisks will appear). This is normal for security.'
echo ""

script -q -c "soundness-cli generate-key --name $KEY_NAME" ./soundness_keys/$KEY_NAME/key_info

echo "Moving key store file to the folder..."
KEY_STORE_PATH="/workspaces/codespaces-blank/key_store.json"

if [ -f "$KEY_STORE_PATH" ]; then
    mv "$KEY_STORE_PATH" ./soundness_keys/$KEY_NAME/key_store.json
    echo "Key store file moved successfully."
else
    echo "Could not find key store file at: $KEY_STORE_PATH"
    echo "Trying to find key store file in the current directory..."
    
    if [ -f "./key_store.json" ]; then
        mv "./key_store.json" ./soundness_keys/$KEY_NAME/key_store.json
        echo "Key store file found and moved successfully."
    else
        echo "Key store file not found. You may need to manually move it."
        touch ./soundness_keys/$KEY_NAME/key_store.json
    fi
fi

echo ""
echo "╔════════════════════════════════════════════════╗"
echo "║           Installation completed!              ║"
echo "╚════════════════════════════════════════════════╝"
echo "Your key information has been saved to folder: ./soundness_keys/$KEY_NAME/"
echo "Key files saved:"
echo "  - ./soundness_keys/$KEY_NAME/key_info (contains mnemonic phrase and public key)"
echo "  - ./soundness_keys/$KEY_NAME/key_store.json (key store file)"
echo ""
echo "Next steps:"
echo "1. Join Discord: https://discord.gg/soundnesslabs"
echo "2. Enter #testnet-access channel"
echo "3. Send !access + your public key (found in the key_info file)"
echo "4. Done!"