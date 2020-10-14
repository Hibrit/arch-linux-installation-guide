echo
lsblk
echo
lsblk -f
echo
echo
echo "please specify the device you will use (sdx) >> "
read device

# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can 
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/${device}
  g # create gpt partition table
  n # new partition
  1 # partition number 1
    # default - start at beginning of disk 
  +500M # 500 MB boot parttion
  t # select type
  1 # select type as efi
  n # new partition
  2 # partion number 2
    # default, start immediately after preceding partition
  +9G # create a 9G partition for swap
  t # select type
  2 # select 2nd partition
  19 # set it to linux swap
  n # create root filesys
  3 # 3rd partition
    # default
    # default
  w # write the partition table and quit
EOF

#! making filesystems
mkfs.fat -f32 /dev/${device}1
fatlabel /dev/${device}1 boot

mkswap /dev/${device}2 -L swap
swapon /dev/${device}2

mkfs.ext4 /dev/${device}3 -L ARCH

#! mounting
mount /dev/${device}3 /mnt
mkdir /mnt/boot

mount /dev/${device}1 /mnt/boot
