#!/bin/bash

# Step 1: Update System and Install Basic Tools
echo "Updating system and installing basic tools..."
dnf update -y
dnf install epel-release -y
dnf install git wget net-tools -y

# Step 2: Configure Storage for FOG
echo "Configuring storage for FOG..."
if df -h | grep -q "/images"; then
  echo "/images is already mounted."
else
  echo "Please ensure /images is mounted before proceeding."
  exit 1
fi

mkdir -p /images
chmod 777 /images
echo "Storage configured successfully."

# Step 3: Install FOG
echo "Installing FOG..."
sudo -i <<EOF
cd /root
git clone https://github.com/FOGProject/fogproject.git
cd fogproject/bin
./installer.sh
EOF

echo "During installation, follow these steps:"
echo "1. Choose option 1 (Normal Server)."
echo "2. Use default configurations."
echo "3. Say 'Y' to configure services."
echo "4. Enter your server's IP when prompted."

echo "FOG installation process complete. Follow the on-screen instructions during the installation."

