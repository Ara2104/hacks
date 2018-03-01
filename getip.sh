#!/usr/bin/env bash

################################################
# Discovery Phase of a Penetration Test
# Tested On Kali 2018.1
# Get the IP Address of Your Target
# This is an Interactive Script
# Results are saved in ip.txt
# First Make The File Executable chmod +x *.sh
# Usage: ./getip.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
echo "Usage: ./getip.sh"
echo
echo "Get the IP Address of your target"
echo
echo -n "Enter Target Domain: "
read domain
echo "Give it a sec, it's getting real"
echo
echo "Saving Results to gotIP.txt"
echo
# If it all worked then the IP Address will bin ip.txt
ping -c 1 $domain | tee ping.txt | awk 'NR==1' | tr -d '()' | awk '{print $3}'
echo
echo "Saving IP Address into ip.txt"
echo
echo
# Best Team Ever!
echo "Go Ducks!"