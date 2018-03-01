#!/usr/bin/env bash

################################################
# Tested on Kali 2018.1
# Lovely TCP Packet Captures - If you have to do something more than two times automate it!
# This Is The First Thing I do On Any Penetration Test Engagement
# Make The File Executable chmod +x *.sh
# Usage: ./tcpdump.sh
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
# Interactive TCP Packet Captures
echo "TCP Dumps"
echo
echo -n "Specify interface, example eth0: "
read interface
echo -n "Specify Output Directory?: "
read directory
echo -n "Specify output name for results: "
read name
echo "It's Getting Real, Be Patient"
tcpdump -i $interface -s 0 -n -vv -C 500 -z bzip2 -w $directory$name.pcap
echo
echo "TCP Dump is running" 
echo
# Best Team Ever!
echo
echo "Go Ducks!"