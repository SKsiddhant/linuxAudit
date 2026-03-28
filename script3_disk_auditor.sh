#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Siddhant Kothiya | Roll: 24bce10109
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Loops through key system directories and reports their
#              size, owner, and permissions. Also checks the Linux Kernel's
#              config/boot directory specifically.
# Concepts: for loop, arrays, du, ls -ld, awk, cut, if-then-else

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================================"
echo "         Disk and Permission Auditor"
echo "========================================================"
echo "  Student: Siddhant Kothiya | Software: Linux Kernel"
echo "--------------------------------------------------------"
printf "  %-15s %-25s %s\n" "Directory" "Permissions  Owner Group" "Size"
echo "--------------------------------------------------------"

# --- Loop through each directory in the array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # awk extracts fields: $1=permissions, $3=owner, $4=group from ls -ld output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size; cut -f1 extracts just the size column
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-15s %-25s %s\n" "$DIR" "$PERMS" "$SIZE"
    else
        echo "  $DIR — does not exist on this system"
    fi
done

echo "--------------------------------------------------------"
echo "  Linux Kernel — Boot & Config Directory Check (/boot)"
echo "--------------------------------------------------------"

# --- Check the Linux Kernel's specific config directory ---
KERNEL_DIR="/boot"
if [ -d "$KERNEL_DIR" ]; then
    # Show permissions of /boot where kernel images are stored
    PERMS=$(ls -ld "$KERNEL_DIR" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$KERNEL_DIR" 2>/dev/null | cut -f1)
    echo "  Path        : $KERNEL_DIR"
    echo "  Permissions : $PERMS"
    echo "  Size        : $SIZE"
    echo ""
    # List kernel image files present in /boot
    echo "  Kernel images found in /boot:"
    ls /boot/vmlinuz-* 2>/dev/null | while read -r f; do
        echo "    -> $f"
    done
else
    echo "  /boot directory not found on this system."
fi

echo "========================================================"
