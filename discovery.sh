#!/usr/bin/env bash

################################################
# Tested on Kali 2018.1
# Part Of The Discovery Phase Of A Penetration Test
# Use this Script To Get the IP Address / CIDR / NetRange of your Target
# Results Are saved in ip.txt & whois.txt
# Make The File Executable chmod +x *.sh
# Usage: ./discovery.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
echo "Usage: ./discovery.sh"
echo
echo "Discover The IP Address And CIDR Of Your Target"
echo
echo "Example: Type example.com"
echo
echo -n "Enter Target Domain: "
read domain
echo
echo "Give It A Sec, It's Getting Real"
echo
echo "In a Perfect World The IP Address is saved in ip.txt"
echo
# Parse and output results
ping -c 1 $domain | tee ping.txt | awk 'NR==1' | tr -d '()' | awk '{print $3}' | tee ip.txt
echo
echo "Time To Get The CIDR"
echo
whois $(cat ip.txt) > whois.txt && cat whois.txt | grep -w 'NetRange\|CIDR\|Organization' | tee gotcidr.txt
echo
echo "Attempting To Save Results To ip.txt & gotcidr.txt"
echo
echo
# Best Team Ever
echo "Go Ducks!"
echo
# Depending On Your Objective You Might Use masscan
echo "Use masscan-interactive.sh Next to find live hosts"
echo
echo "Try ./masscan-interactive.sh"
