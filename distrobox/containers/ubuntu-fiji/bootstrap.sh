set -euo pipefail

sudo apt-get update
sudo apt-get install -y wget unzip ca-certificates \
  libxext6 libxrender1 libxtst6 libxi6 libfreetype6

sudo mkdir -p /opt/fiji
cd /tmp
wget -O fiji.zip "https://downloads.imagej.net/fiji/latest/fiji-latest-linux64-jdk.zip"
sudo unzip -q fiji.zip -d /opt/fiji

sudo ln -sf /opt/fiji/Fiji.app/ImageJ-linux64 /usr/local/bin/fiji

