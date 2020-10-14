#!/bin/bash


#todo use iwctl to connect the network (remember python scripts[make it binary{compile}])

#* UEFI checker
if [ -d "/sys/firmware/efi/efivars" ]; then
    ./uefi.sh
else 
    echo "system is not uefi developers will soon release an mbr version"
fi
