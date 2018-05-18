#!/usr/bin/env bash


# -------------------------------------------------------------------
# Vagrant Installation
# -------------------------------------------------------------------

if [[ $(/usr/bin/which vagrant) ]]; then

    echo "Vagrant already installed is already installed.\n"
    echo 'Installed Vagrant version is '$(vagrant -v) '\\n'
else
    echo "Installing Vagrant... "
    sudo apt-get install vagrant
fi

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



