#!/usr/bin/env bash
################################################
# Tested on Kali 2018.1
# This Script Counts matching lines of a file that is generated by using a nmap file parser
# Here is the order of operation to successfully use this script
# First Make The counter.sh executable. Example: root@kali:~# chmod +x *.sh
# Run ./parser.py <scan.nmap>, you will see an output file named results.csv
# Usage: ./counter.sh
# Learn more at https://github.com/aryanguenthner/
# Last Updated 2018-03-01
################################################
echo
echo "Discover How Many Products Are In Your Environment"
echo
# If you used the parser you will have a file named results.csv to use with this counter
echo "Please Use results.csv That The Nmap File parser Generated: "
read file
echo
# Getting The Results Ready
cat $file | grep -v tcpwrapped > cleaned.txt &&
cat cleaned.txt | sort  > file.txt &&
cat file.txt | sort -n | uniq -c > counted.txt &&
cat counted.txt | sed 's/Host is up//g; s/open//g; s/syn-ack//g' > tally.txt &&
echo
# Print Out The Top Results
echo "Here Are The Top Results"
echo
# Saving results to a file
cat tally.txt | sort -n
echo
echo
echo "Saving to tally.txt"
echo
echo
echo "Done! Man That Was Fast"
echo
echo
# The Best Team Ever
echo "Go Ducks!"
