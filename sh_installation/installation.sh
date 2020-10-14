#!/bin/bash


#todo use iwctl to connect the network (remember python scripts[make it binary{compile}])


#todo 'ls /sys/firmware/efi/efivars' check if this command has an output or error if error system is mbr if not system is uefi
UEFI = ./uefiChecker.sh "ls /sys/firmware/efi/efivars"
