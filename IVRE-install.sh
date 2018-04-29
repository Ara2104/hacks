#!/usr/bin/env bash

################################################
# IVRE Post Kali Install Tested on Kali 2018.1
# First Make This File Executable chmod +x IVRE-install.sh
# Usage: ./IVRE-install.sh 
# Learn more at https://github.com/aryanguenthner
# Last Updated 2018-04-27
# nmap -iL ips.txt -T5 -sV -sT -vv --max-parallelism 250 --max-retries 0 --script=rpcinfo,nfs-showmount,nfs-ls,smb-enum-shares,smb-ls,http-git,ftp-anon,http-open-proxy,socks-open-proxy,smtp-open-relay,ftp-bounce,x11-access,http-auth,http-screenshot,http-sqlinjection,ms-sql-empty-password -p 21,25,137,139,445,80,443,1443,1434,3306,6000,6001,8080,5900,5901 -oA nmap-ivre-scans-01 && ivre scan2db nmap-ivre-scans-01.xml
echo
# IVRE ROCKS - An Interesting way to look at all the things
cd /opt
git clone https://github.com/cea-sec/ivre.git
cd ivre
python setup.py build
sudo python setup.py install
echo
# Debian IVRE Config
echo 'APT::Default-Release "stable";' | \
sudo tee /etc/apt/apt.conf.d/99defaultrelease
echo 'deb http://deb.debian.org/debian testing main' | \
sudo tee -a /etc/apt/sources.list
sudo apt-get update
echo
# More Debian IVRE Configs for dokuwiki
sudo -s
cd /var/www/html ## or depending on your version /var/www
rm index.html
ln -s /usr/local/share/ivre/web/static/* .
cd /var/lib/dokuwiki/data/pages
ln -s /usr/local/share/ivre/dokuwiki/doc
cd /var/lib/dokuwiki/data/media
ln -s /usr/local/share/ivre/dokuwiki/media/logo.png
ln -s /usr/local/share/ivre/dokuwiki/media/doc
cd /usr/share/dokuwiki
patch -p0 < /usr/local/share/ivre/dokuwiki/backlinks.patch
cd /etc/apache2/mods-enabled
for m in rewrite.load wsgi.conf wsgi.load ; do
>   [ -L $m ] || ln -s ../mods-available/$m ; done
cd ../
# replace /usr/share/ivre/web/wsgi/app.wsgi with the actual location if needed:
echo 'Alias /cgi "/usr/share/ivre/web/wsgi/app.wsgi"' > conf-enabled/ivre.conf
echo '<Location /cgi>' >> conf-enabled/ivre.conf
echo 'SetHandler wsgi-script' >> conf-enabled/ivre.conf
echo 'Options +ExecCGI' >> conf-enabled/ivre.conf
echo 'Require all granted' >> conf-enabled/ivre.conf
echo '</Location>' >> conf-enabled/ivre.conf
sed -i 's/^\(\s*\)#Rewrite/\1Rewrite/' /etc/dokuwiki/apache.conf
echo 'WEB_GET_NOTEPAD_PAGES = "localdokuwiki"' >> /etc/ivre.conf
service apache2 reload  ## or start
exit
echo
# Fix mongodb
sudo rm /var/lib/mongodb/mongod.lock
sudo mongod --repair
sudo service mongodb start
sudo service mongodb status
echo
exit
# Go Ducks!