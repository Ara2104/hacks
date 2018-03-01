#!/usr/bin/env bash

################################################
# Tested On Kali 2018.1
# Convert a List of IP Address Line Seperated and Append them with "http://"
# This is an Interactive Script
# Do You Have Your Targets Identified? Use the Discovery and Masscan Scripts It Might Help
# First Make The File Executable chmod +x *.sh
# Usage: ./ips-to-urls.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
echo -n "Enter File Name with IP Addresses: "
read  file
for i in $(cat $file); do echo http://$i; done > urls.txt &&
mkdir /root/Desktop/urls
cp urls.txt /root/Desktop/urls
echo
echo "Saving to /root/Desktop/urls.txt"
echo
echo
# Best Team Ever
echo "Go Ducks!"
