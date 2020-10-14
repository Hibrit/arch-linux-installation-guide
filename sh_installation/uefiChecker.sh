#!/bin/bash
if [ -d "$1" ]; then
    ./uefi
else 
    echo "system is not uefi developers will soon release an mbr version"
fi