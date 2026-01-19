set -euo pipefail

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  ca-certificates wget gnupg lsb-release software-properties-common gdebi-core

# --- Add CRAN apt repo for Ubuntu (noble) ---
# Use a dedicated keyring (apt-key is deprecated)
sudo install -d -m 0755 /etc/apt/keyrings

# CRAN’s signing key (official)
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/cran.gpg

# Add CRAN repo matching the Ubuntu codename (noble on 24.04)
UBUNTU_CODENAME="$(lsb_release -cs)"
echo "deb [signed-by=/etc/apt/keyrings/cran.gpg] https://cloud.r-project.org/bin/linux/ubuntu ${UBUNTU_CODENAME}-cran40/" \
  | sudo tee /etc/apt/sources.list.d/cran-r.list > /dev/null

sudo apt-get update

# Install R from CRAN + dev headers/tools for compiling packages
sudo apt-get install -y r-base r-base-dev

# --- Optional polish: tools for compiling CRAN packages ---
sudo apt-get install -y build-essential gfortran

# --- Install RStudio Desktop (downloaded .deb) ---
cd /tmp
wget -O rstudio.deb "https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.12.0-467-amd64.deb"
sudo gdebi -n rstudio.deb

# --- Set default CRAN mirror for all users (avoid interactive prompt) ---
# This makes install.packages() non-interactive by default.
echo 'options(repos = c(CRAN = "https://cloud.r-project.org"))' \
  | sudo tee -a /etc/R/Rprofile.site > /dev/null

