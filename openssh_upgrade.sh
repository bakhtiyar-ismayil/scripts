#!/bin/bash

# List of packages to check
packages=("make" "perl-core" "pcre-devel" "wget" "zlib-devel" "gcc")

# Function to check and install a package
check_and_install() {
    local package=$1
    if rpm -q "$package" &> /dev/null; then
        echo "Package '$package' is already installed."
    else
        echo "Package '$package' is not installed. Installing..."
        sudo yum install -y "$package" || {
            echo "Failed to install '$package'."
            exit 1
        }
    fi
}

# Check and install required packages
for pkg in "${packages[@]}"; do
    check_and_install "$pkg"
done

# Download and install OpenSSL
echo "Downloading OpenSSL 3.3.1..."
wget https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz || {
    echo "Failed to download OpenSSL. Exiting."
    exit 1
}

echo "Extracting OpenSSL 3.3.1..."
tar -xzvf openssl-3.3.1.tar.gz || {
    echo "Failed to extract OpenSSL. Exiting."
    exit 1
}

cd openssl-3.3.1 || {
    echo "Failed to change directory to openssl-3.3.1. Exiting."
    exit 1
}

echo "Configuring OpenSSL..."
./config --prefix=/usr --openssldir=/usr/local/ssl || {
    echo "Configuration failed. Exiting."
    exit 1
}

echo "Building OpenSSL..."
make || {
    echo "Build failed. Exiting."
    exit 1
}

echo "Installing OpenSSL..."
sudo make install || {
    echo "Installation failed. Exiting."
    exit 1
}

# Verify OpenSSL installation
echo "OpenSSL version:"
openssl version

# Return to the previous directory
cd ..

# Download and install OpenSSH
echo "Downloading OpenSSH 9.8p1..."
wget https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz || {
    echo "Failed to download OpenSSH. Exiting."
    exit 1
}

echo "Extracting OpenSSH 9.8p1..."
tar -xzvf openssh-9.8p1.tar.gz || {
    echo "Failed to extract OpenSSH. Exiting."
    exit 1
}

cd openssh-9.8p1 || {
    echo "Failed to change directory to openssh-9.8p1. Exiting."
    exit 1
}

echo "Configuring OpenSSH..."
./configure || {
    echo "Configuration failed. Exiting."
    exit 1
}

echo "Building OpenSSH..."
make || {
    echo "Build failed. Exiting."
    exit 1
}

echo "Installing OpenSSH..."
sudo make install || {
    echo "Installation failed. Exiting."
    exit 1
}

# Verify OpenSSH installation
echo "OpenSSH version:"
ssh -V


