# Soundness Installer

This script automates the installation process for the Soundness testnet and key generation.

## Features

- One-command installation of all required dependencies
- Automatic installation of Rust and Soundness CLI
- Guided key generation process
- Organized storage of key information

## GitHub Codespace Setup

1. Go to GitHub and create a new repository
2. Click on the "Codespace" button
3. Select "Use this template" > "Blank"
4. Once your Codespace is ready, you can proceed with the installation

## Quick Installation

You can easily install using curl:

```bash
curl -sSL https://raw.githubusercontent.com/WINGFO-HQ/Soundness/main/soundness.sh | bash
```

Or with wget:

```bash
wget -O - https://raw.githubusercontent.com/WINGFO-HQ/Soundness/main/soundness.sh | bash
```

## Manual Installation

If you prefer to download the script first:

1. Download the script:

   ```bash
   curl -O https://raw.githubusercontent.com/WINGFO-HQ/Soundness/main/soundness.sh
   ```

   or

   ```bash
   wget https://raw.githubusercontent.com/WINGFO-HQ/Soundness/main/soundness.sh
   ```

2. Make it executable:

   ```bash
   chmod +x soundness.sh
   ```

3. Run the script:
   ```bash
   ./soundness.sh
   ```

## What the Script Does

1. Creates a directory structure for your keys
2. Installs system dependencies
3. Installs Rust
4. Installs Soundness CLI
5. Guides you through key generation
6. Organizes your key information in a dedicated folder

## Next Steps After Installation

1. Join Discord: https://discord.gg/soundnesslabs
2. Enter #testnet-access channel
3. Send !access + your public key (found in the key_info file)
4. Start participating in the testnet

## Troubleshooting

If you encounter any issues:

- Ensure you have internet connectivity
- Make sure you have sufficient permissions
- Try running the commands manually as shown in the script

## License

MIT License

## Disclaimer

This is an unofficial community-created tool. Use at your own risk.
