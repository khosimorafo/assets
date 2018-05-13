#!/usr/bin/env bash


# The is no default path. Valid path must be supplied
if [ -z "$1" ]
  then
    echo "Err: Missing argument. Please supply install dir as first argument."
    exit 1
fi

echo "inside 2nd $1"

if [ ! -d "$1" ]
    then

    echo "Err: Invalid path. Please supply valid dir as argument for {ecte.assets}."
    exit 1
fi

if [ ! -d "$2" ]
    then

    echo "Err: Invalid path. Please supply valid dir as argument for {ecte.bin}."
    echo "Supplied values is $2"
    exit 1
fi

# -------------------------------------------------------------------
# Vagrant Installation
# -------------------------------------------------------------------

wget https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_linux_amd64.zip -O vagrant.zip
ls -al
unzip vagrant.zip
mv vagrant "$2"

# -------------------------------------------------------------------
# VirtualBox installation script with Guest Additions
# -------------------------------------------------------------------

if [[ $(/usr/bin/which virtualbox) ]]; then
    echo "VirtualBox is already installed. Exiting ...."
    exit 0
fi

exit 1

# 1. Add VirtualBox source
echo "deb http://download.virtualbox.org/virtualbox/debian `lsb_release -cs` contrib" > virtualbox.list
sudo mv virtualbox.list /etc/apt/sources.list.d/
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

# 2. Install VirtualBox
sudo apt-get update
sudo apt-get install -y linux-headers-`uname -r` build-essential virtualbox-5.2 dkms


# 3. Install Guest Additions
wget http://download.virtualbox.org/virtualbox/5.2.10/VBoxGuestAdditions_5.2.10.iso

sudo mkdir /media/VBoxGuestAdditions

sudo mount -o loop,ro VBoxGuestAdditions_5.2.10.iso /media/VBoxGuestAdditions

sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run

sudo rm VBoxGuestAdditions_5.2.10.iso

sudo umount /media/VBoxGuestAdditions

sudo rmdir /media/VBoxGuestAdditions



