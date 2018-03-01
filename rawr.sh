#!/usr/bin/env bash

################################################
# Tested On Kali 2018.1
# RAWR Web Services Enumeration Interactive Script
# Want to install RAWR?
# cd /opt
# git clone https://bitbucket.org/al14s/rawr.git
# cd rawr
# yes | ./install.sh
# Do You Have Your Targets Identified? Use the Discovery and Masscan Scripts It Might Help
# Usage: ./rawr.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################

echo "RAWR Web Service Enumeration"
echo

# Test if RAWR is installed
if [ -d /opt/rawr/ ]
then
    echo "RAWR Is Installed, So Far Everything Looks Good"
else
    echo "Make Sure RAWR is Installed in /opt Then Come Back"
fi

echo
# If you used masscan-interactive.sh you will have ips.txt use that as your input file
echo -n "Enter the Target URL, IP, Subnet, Input File: "
read target
echo
echo  "Which Ports You Want To Scan? Example: 80,8181,8080,8443"
echo
# Type fuzzdb for even more results
echo -n "Enter Port Numbers Remember To Use Commas or Type fuzzdb: "
read ports
echo
echo -n "Enter The Path To Save The Results: "
echo
read path
echo
echo "It's Getting Real, Be Calm And Chill"
python /opt/rawr/rawr.py $target -p$ports -d$path --rd -t5 -a
echo
echo "Saving Output To $path"
echo
#The Best Team Ever
echo "Go Ducks!"
