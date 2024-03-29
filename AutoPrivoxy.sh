#!/bin/bash

############################################
# https://github.com/techroy23/AutoPrivoxy #
############################################

echo ""
echo ""
echo ""
echo "PLease wait ..."
PUBLIC_IPV4=$(curl ifconfig.co)

read -rp "Please enter the port you want Privoxy to use between ( 1000 - 65560 ) : " -e -i "" PORT
if [[ $PORT == "" ]]; then
PORT=8118
fi
echo "Privoxy will run on PORT : $PORT"
read -rp "Press any key to continue ..."

echo RUNNING "sudo apt update -y && apt upgrade -y && apt autoclean -y && apt autoremove -y"
sudo apt update -y && apt upgrade -y && apt autoclean -y && apt autoremove -y

echo RUNNING "sudo apt-get install privoxy net-tools -y"
apt-get install privoxy net-tools -y

rm /etc/privoxy/config

cat << ENDOFFILE >> /etc/privoxy/config
user-manual /usr/share/doc/privoxy/user-manual
confdir /etc/privoxy
logdir /var/log/privoxy
filterfile default.filter
logfile logfile
listen-address  0.0.0.0:PORT
toggle  1
enable-remote-toggle  0
enable-remote-http-toggle  0
enable-edit-actions 0
enforce-blocks 0
buffer-limit 4096
enable-proxy-authentication-forwarding 1
forwarded-connect-retries  1
accept-intercepted-requests 1
allow-cgi-request-crunching 1
split-large-forms 0
keep-alive-timeout 5
tolerate-pipelining 1
socket-timeout 300
permit-access 0.0.0.0/0 MYIP
ENDOFFILE

sed -i "s|MYIP|$PUBLIC_IPV4|" '/etc/privoxy/config'
sed -i "s|PORT|$PORT|" '/etc/privoxy/config'

service privoxy restart

echo ""
echo ""
echo ""
echo PRIVOXY STATUS && service privoxy status | grep active
netstat -lntp | grep privoxy
echo ""
echo ""
echo ""
