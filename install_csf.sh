#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script as root (sudo)."
    exit 1
fi

echo "Updating the system..."
dnf update -y

echo "Installing necessary packages..."
dnf install perl-libwww-perl perl-Math-BigInt wget -y

echo "Downloading CSF..."
cd /usr/src
wget https://download.configserver.com/csf.tgz

echo "Extracting and installing CSF..."
tar -xzf csf.tgz
cd csf
sh install.sh

echo "Checking CSF installation..."
perl /usr/local/csf/bin/csftest.pl

echo "Checking iptables..."
which iptables

echo "Installing iptables-services..."
dnf install -y iptables-services

echo "Rechecking CSF installation..."
perl /usr/local/csf/bin/csftest.pl

echo "Configuring CSF for DirectAdmin..."
sed -i 's/^TESTING = "1"/TESTING = "0"/' /etc/csf/csf.conf
sed -i 's/^RESTRICT_SYSLOG = "0"/RESTRICT_SYSLOG = "3"/' /etc/csf/csf.conf

echo "Starting CSF..."
systemctl restart csf && systemctl restart lfd
systemctl enable csf && systemctl enable lfd
systemctl status csf && systemctl status lfd

echo "Checking CSF version..."
csf -v

echo "CSF has been successfully installed on DirectAdmin!"