#!/bin/bash

# 1. Start NetworkManager
echo "Starting NetworkManager..."
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# 2. Set password for the core user
PASSWORD="R3dh4t1!"
echo "Setting password for core user..."
echo "core:$PASSWORD" | sudo chpasswd

# 3. Enable password authentication for SSH
echo "Configuring SSH to allow password authentication..."
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/40-rhcos-defaults.conf

# 4. Remove /run/nologin file if it exists
if [ -f /run/nologin ]; then
    echo "Removing /run/nologin file to allow SSH access..."
    sudo rm /run/nologin
fi

# 5. Restart SSH service to apply changes
echo "Restarting SSH service..."
sudo systemctl restart sshd

echo "Configuration complete."
