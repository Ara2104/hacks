#!/usr/bin/env bash

################################################
# Kali Update Kali 2018.1
# First Make The File Executable chmod +x *.sh
# Usage: ./kali-update.sh 
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
apt update && apt -y upgrade && apt -y full-upgrade && apt clean && apt -y autoremove
echo
echo
# Best Team Ever
echo "Go Ducks!"
