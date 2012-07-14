#! /usr/bin/env bash

# Add Opscode APT to the source list
echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

# Add Opscode GPG key
sudo mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null

# Update
sudo apt-get update

# Install opscode-keyring to keep keyring up to date
sudo apt-get install opscode-keyring # permanent upgradeable keyring

# Upgrade

sudo apt-get upgrade
