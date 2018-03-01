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

echo
echo "Usage: ./getcidr.sh"
echo
echo "Get the CIDR / Net Range / Organization Info of an IP Address"
echo
echo -n "Enter Target IP Address: "
read address
echo "Give it a sec, Recon is real"
echo
echo "Saving Results to gotcidr.txt"
echo
whois $address > whois.txt && cat whois.txt | grep -w 'NetRange\|CIDR\|Organization' | tee gotcidr.txt
echo
echo "Saving Subnet to subnet.txt"
whois $address > whois.txt && cat whois.txt | grep -i 'CIDR' > cidr-subnet.txt | cat cidr-subnet.txt | awk '{print $2}' > subnet.txt
echo
echo
