#!/bin/bash

#! delete after test
echo 'the system is uefi'

#* update the system clock from internet
#timedatectl set-ntp true

#todo partitioning and mounting (python)[or](shell scipting)

#* updating mirrors
#pacman -Syy

#* if your speed is not what you have as an internet connection we should update our mirrors first install reflector
#pacman -S reflector

#* updating default mirrors with reflector
#reflector -c Turkey -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#* re checking our mirrors
#pacman -Syy

#* installing basic system packages and some necessary things
#pacstrap --noconfirm /mnt base linux linux-firmware vim

#* generating fstab with UUID's and subvolid's
#genfstab -U /mnt >> /mnt/etc/fstab

#! checking the fstab !! important to check
#vim /mnt/etc/fstab

#! change your active root to newly installed one
#arch-chroot /mnt

#! clock and locales

#! network configuration and passwd setting

#! installing some packages

#! startup configuration user creation