COMMENT
################################################
# Tested on Windows 10 Pro
# I wrote this for Launching Burp Suite and Firefox
# Usage: First edit the burp.bat file to fit your configuration
# Place the burp.bat file on your Windows Desktop and open it
# Learn more at https://github.com/aryanguenthner/hacks
# Last Updated 2018-04-16
################################################
ENDCOMMENT
@echo off
cd "C:\Program Files\Mozilla Firefox\"

start firefox.exe

start java -jar -Xmx4G "C:\Users\user\Downloads\burpsuite_community_1.7.33.jar"

exit