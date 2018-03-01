#!/bin/bash
################################################
# Kali Post Setup Tested on Kali 2018.1
# First Make The File Executable chmod +x *.sh
# Usage: ./kali-setup.sh 
# Learn more at https://github.com/aryanguenthner/hacks
# Last Updated 2018-03-01
################################################
echo
echo "Downloading and Installing Google Chrome Stable"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && 
dpkg -i google-chrome-stable_current_amd64.deb &&
sed -i '49d' /usr/bin/google-chrome-stable &&
echo 'exec -a "$0" "$HERE/chrome" "$@" --no-sandbox --user-data-dir' >> /usr/bin/google-chrome-stable
