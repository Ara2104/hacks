#!/usr/bin/env bash

################################################
# Kali Post Setup Tested on Kali 2018.1
# First Make The File Executable chmod +x *.sh
# Usage: ./kali-setup.sh 
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-03-01
################################################
echo
# I use Pycharm for Python Programming
echo "Setting Pycharm Working Directory"
echo "Done"
# Make a working directory for Pycharm
mkdir /root/Desktop/python-stuff/
# Display Kali IP Address
echo "Kali IP Address"
hostname -I
echo
# Properly Update Kali
echo "Updating Kali"
wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
apt update && apt -y upgrade && apt -y full-upgrade && apt clean && apt -y autoremove
echo
# Installing these make life easier
echo "Installing Tools"
echo
apt -y install build-essential nfs-common cifs-utils xutils-dev gimp vlc git gcc-6 curl openssl libreoffice git libmbim-utils terminator graphviz python-pygraphviz python-lxml python-libpcap python-qt4 python-pip python-imaging python3-dev xvfb cmake mongodb libappindicator1 open-vm-tools-desktop fuse	
echo
# Some of my most frequently used Git Repositories
cd /opt
echo
git clone https://github.com/Veil-Framework/Veil.git
cd Veil/setup
./setup.sh -s
echo
cd /opt
echo
git clone https://github.com/khr0x40sh/MacroShop.git
echo
cd /opt
git clone https://github.com/CoreSecurity/impacket.git
echo
cd impacket
python setup.py install
echo
cd /opt
git clone https://bitbucket.org/al14s/rawr.git
cd rawr
yes | ./install.sh
echo
cd /opt
git clone https://github.com/citronneur/rdpy
cd rdpy
python setup.py install
cd /opt
pip3 install gplaycli
echo
cd /opt
git clone https://github.com/gojhonny/InSpy.git
echo
cd /opt
git clone https://github.com/n1nj4sec/pupy.git
cd pupy
git submodule init
git submodule update
pip install -r pupy/requirements.txt
wget https://github.com/n1nj4sec/pupy/releases/download/latest/payload_templates.txz
tar xvf payload_templates.txz && mv payload_templates/* pupy/payload_templates/ && rm payload_templates.txz && rm -r payload_templates
echo
cd /opt
git clone https://github.com/leebaird/discover.git
# Adding Kali IP Address to Terminal Windows"
echo '# Kali IP' >> /root/.bashrc
echo 'hostname -I' >> /root/.bashrc
# Enabling SSH"
echo "Enabling SSH"
sed -i '32s/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl enable ssh
service ssh restart
echo
updatedb
echo "Rebooting"
echo
reboot