#!/usr/bin/env python

################################################################################################
# Tested on Kali 2018.1
# Parse nmap output files then output results into a file
# Learn More at https://github.com/aryanguenthner
# nmap -sT -sV -n --open -vv -p 21,22,23 --max-retries 0 --max-parallelism 100 -oA nmap212223 -iL ips.txt
# First Make The File Executable chmod +x *.sh
# Usage: ./parser.py <scan.nmap>
# Last Updated 2018-03-01
################################################
import sys
import re
import csv

# How to use this nmap parser
print('Usage: ./nmap-parser.py <scan.nmap>\n')

# If you don't use it correctly you will have to try again
if len(sys.argv) == 1:
    print ('Did you forget something? --> Usage: ./parser.py scan.nmap\n\r')

if len(sys.argv) == 2:
    print ('Parsing Initiated')

#  Takes user supplied scan.nmap file as input
input = sys.argv[1]

print('')
# Open the input file, write results to results.csv.
with open(input, 'r') as rf:
    with open('results.csv', 'w') as wf:
        for line in rf.readlines():

# Uncomment if you want the IP address of the open port.
#            if 'Nmap scan report' in line:
#                wf.write(line)
#                print(line)

            if 'tcp' in line:
                wf.write(line)
                print(line)






print('')
print('Saving to results.csv')
print('')
print('Man that was fast!')
print('')
print('Go Ducks!')
print('')
print('Use The Counter To Get A Summary Of The Results: ./counter.sh')
