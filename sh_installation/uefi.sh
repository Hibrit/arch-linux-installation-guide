#!/bin/bash

#* update the system clock from internet
timedatectl set-ntp true

#* partitioning in shell scripting
./partitioning.sh

#* installing basic system packages and some necessary things
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | pacstrap /mnt base linux linux-firmware vim git wget
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

#* mv post chroot newly installed systems root directory
mv postChroot.sh /mnt/root/

#* change your active root to newly installed one
arch-chroot /mnt /bin/bash -c "su - -c /root/postChroot.sh"

#* remove postChroot.sh
rm /mnt/root/postChroot.sh

#* unmount systemparts and reboot
# echo 'Please remember to remove your installation media after system is closed before restarted'
# sleep 5

# umount -R /mnt
# reboot