#!/usr/bin/env bash


# The is no default path. Valid path must be supplied
if [ -z "$1" ]
  then
    echo "Err: Missing argument. Please supply install dir as first argument."
    return 1
fi

install_bin = "$1"

if [ ! -d "install_bin" ]
    then
      echo "Err: Invalid path. Please supply valid dir as argument."
    return 1
fi


# -------------------------------------------------------------------
# Vagrant Installation
# -------------------------------------------------------------------

temp_dir=$(mktemp -d)
curl --silent -L wget https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_linux_amd64.zip -o "$temp_dir/vagrant.zip"
pushd "$temp_dir"
unzip vagrant.zip
cp vagrant "$1"
popd
rm -rf "$temp_dir"

# -------------------------------------------------------------------
# VirtualBox installation script with Guest Additions
# -------------------------------------------------------------------

if [[ $(/usr/bin/which -A) ]]; then
    echo "VirtualBox is already installed. Exiting ...."
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



