#!/bin/bash

#* update the system clock from internet
timedatectl set-ntp true

#* partitioning in shell scripting
./partitioning.sh

#* installing basic system packages and some necessary things
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | pacstrap /mnt base linux linux-firmware vim git
  1
  Y
EOF

#* generating fstab with UUID's and subvolid's
genfstab -U /mnt >> /mnt/etc/fstab

#* checking the fstab !! important to check
echo
lsblk
echo
lsblk -f
cat /mnt/etc/fstab
printf "is fstab file correct? [y/n] >> "
read -r fstabstatus

[[ "$fstabstatus" == "n" ]] && vim /mnt/etc/fstab || echo

#! wget post chroot newly installed systems root directory
mv postChroot.sh /mnt/root/
# cd /mnt/root
# wget https://github.com/Hibrit/arch-linux-installation-guide/raw/master/sh_installation/postChroot.sh
# chmod a+x postChroot.sh

#! change your active root to newly installed one
arch-chroot /mnt /bin/bash -c "su - -c /root/postChroot.sh"