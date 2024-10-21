#!/bin/bash

PATCH_DIR="./patches"

DWM_DIR="./"  

cd "$DWM_DIR" || { echo "Can't change directory to $DWM_DIR"; exit 1; }

for patch in "$PATCH_DIR"/*.diff; do
    if [ -f "$patch" ]; then
        echo "Installing pathc: $patch"
        patch -p1 < "$patch"
        if [ $? -ne 0 ]; then
            echo "Error with patch: $patch"
            exit 1
        fi
    else
        echo "There is no patches."
    fi
done

echo "All patchese were installed"