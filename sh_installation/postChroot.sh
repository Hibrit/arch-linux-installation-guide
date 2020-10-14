#!/bin/bash

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

printf "what is your computers name >> "
read -r compname

#* setting computers NAME
echo "$compname" > /etc/hostname

#* setting domain resolvers with NAME in the hostname file
printf "\n127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\t${compname}.localdomain\t${compname}" >> /etc/hosts

#* set your root password
echo "please enter your root password twice"
passwd

#* installing some necessary packages
pacman -S --needed --noconfirm grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector openssh xdg-user-dirs tldr

#* insalling bootlader
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

#* creating grub bootloader config
grub-mkconfig -o /boot/grub/grub.cfg

#* enabling network manager to have internet connection on boot up
systemctl enable NetworkManager

#* create user named USERNAME with wheel group privilages we will configure wheel group's privilages later
printf "what is your desired username >> "
read -r username
useradd -mG wheel $username

#* give USERNAME user password
echo "please enter the password for $username twice"
passwd $username

#* edit wheel group's privilages (you can even set it to use sudo without any password) uncomment %wheel ALL=(ALL) ALL line
echo "root ALL=(ALL) ALL" > /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#! switch user to $username create user-dirs wget postInstall.sh
su $username
xdg-user-dirs-update
cd ~
wget https://github.com/Hibrit/setupscripts/raw/master/postInstall.sh
chmod a+x postInstall.sh
exit

#* return to live installer
exit