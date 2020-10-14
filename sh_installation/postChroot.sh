#!/bin/bash

#* selecting time zone
# ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

#* syncronizing systom clock to hardware clock
# hwclock --systohc

#* selecting locales to generate later uncomment the line with correct locale (preferrably en_US.UTF-8)
# echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

#* generate locales
# locale-gen

#* create locale.conf 
# echo "LANG=en_US.UTF-8" > /etc/locale.conf

#! network configuration and passwd setting

printf "what is your computers name >> "
read -r compname

printf "what is your root passwd >> "
read -r rootpasswd

#* setting computers NAME
echo "$compname" > /etc/hostname

#* setting domain resolvers with NAME in the hostname file
echo "\n127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\t${compname}.localdomain\t${compname}" >> /etc/hosts

#! set your root password
# passwd

#! installing some packages

#! startup configuration user creation