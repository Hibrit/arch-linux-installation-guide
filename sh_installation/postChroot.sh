#!/bin/bash
#! clock and locales

#* selecting time zone
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

#* syncronizing systom clock to hardware clock
hwclock --systohc

#* selecting locales to generate later uncomment the line with correct locale (preferrably en_US.UTF-8)
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

#* generate locales
locale-gen

#* create locale.conf 
echo "LANG=en_US.UTF-8" > /etc/locale.conf

#! network configuration and passwd setting

#! installing some packages

#! startup configuration user creation