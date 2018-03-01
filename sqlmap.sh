#!/usr/bin/env bash

################################################
# Recon Phase of a Penetration Test
# Tested On Kali 2018.1
# Discover CIDR, Netrange, and Organization Info
# This is an Interactive Script
# Results are saved in ip.txt
# First Make The File Executable chmod +x *.sh
# Usage: ./getcider.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################

echo -n "Enter the target URL: "
read target
echo
echo "Let's see if your lucky"
echo "Crawl the site?: "
read crawl
if yes; then

else

fi
echo -n "Enter Output Directory: "
read directory
sqlmap -h "$target" --batch --random-agent --user-agent "--level 6 --risk 3 $directory

echo
echo "Go Ducks!"
