#!/bin/bash

#* update the system clock from internet
# timedatectl set-ntp true

#todo partitioning and mounting (python)[or](shell scipting)
#! testing partitioning in shell scripting
# ./partitioning.sh


#! reopen updating mirrors
#pacman -Syy

#! reopen if your speed is not what you have as an internet connection we should update our mirrors first install reflector
#pacman -S --needed --noconfirm reflector

#! reopen updating default mirrors with reflector
#reflector -c Turkey -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#! reopen re checking our mirrors
#pacman -Syy

#* installing basic system packages and some necessary things
# sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | pacstrap /mnt base linux linux-firmware vim git
#   1
#   Y
# EOF

#* generating fstab with UUID's and subvolid's
# genfstab -U /mnt >> /mnt/etc/fstab

#* checking the fstab !! important to check
# echo
# lsblk
# echo
# lsblk -f
# cat /mnt/etc/fstab
# printf "is fstab file correct? [y/n] >> "
# read -r fstabstatus

# [[ "$fstabstatus" == "n" ]] && vim /mnt/etc/fstab || echo

#! clone git repo to newly installed systems root directory
cd /mnt/root
git clone https://github.com/Hibrit/arch-linux-installation-guide.git
# cd arch-linux-installation-guide/sh_installation

#! change your active root to newly installed one
arch-chroot /mnt /root/arch-linux-installation-guide/sh_installation/postChroot.sh