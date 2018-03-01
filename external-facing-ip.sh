#!/usr/bin/env bash

################################################
# Identify Your External Facing IP Address
# Tested On Kali 2018.1
# Results are saved in external.txt
# First Make The File Executable chmod +x *.sh
# Usage: ./external-facing-ip.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
echo
echo "Saving External IP Address into external.txt"
curl -s http://ifconfig.me/ip 2>&1 | tee external.txt
echo
echo
# Best Team Ever!
echo
echo "Go Ducks!"
