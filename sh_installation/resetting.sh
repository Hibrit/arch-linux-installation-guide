#!/bin/bash
#! testing resetter v2

lsblk
echo
printf "please specify the device you will use (sdx) >> "
read -r device

umount -R /mnt
swapoff /dev/${device}2

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/${device}
  g
  n



  w
EOF

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/${device}
  g
  w
EOF