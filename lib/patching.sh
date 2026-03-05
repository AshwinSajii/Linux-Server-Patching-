#!/bin/bash

echo "==== PATCH EXECUTION ===="

echo "Updating repository metadata..."
sudo dnf makecache

echo "Checking for available updates..."
sudo dnf check-update || true

echo "Applying system updates..."
sudo dnf upgrade -y

echo "Patch installation completed."
