#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Siddhant Kothiya | Roll: 24bce10109
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Checks whether a given package is installed using apt/dpkg,
#              prints version/license info, and uses a case statement to
#              display a philosophy note about each known FOSS package.
# Usage: ./script2_package_inspector.sh [package-name]
#        If no argument given, defaults to the linux-image package.

# --- Default to linux-image if no argument provided ---
PACKAGE=${1:-$(dpkg -l | grep -oP 'linux-image-\S+' | head -1)}

echo "========================================================"
echo "         FOSS Package Inspector"
echo "========================================================"
echo "  Checking package: $PACKAGE"
echo "--------------------------------------------------------"

# --- Check if the package is installed using dpkg ---
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "  Status  : INSTALLED"

    # Extract version and description using dpkg-query
    VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
    DESC=$(dpkg-query -W -f='${Description}' "$PACKAGE" 2>/dev/null | head -1)

    echo "  Version : $VERSION"
    echo "  Summary : $DESC"
else
    echo "  Status  : NOT INSTALLED"
    echo "  Tip     : Install with -> sudo apt install $PACKAGE"
fi

echo "--------------------------------------------------------"

# --- Case statement: print a philosophy note for known FOSS packages ---
# This demonstrates how case statements work in bash for pattern matching
case $PACKAGE in
    linux-image-*)
        echo "  Linux Kernel: the foundation all open-source software rests on."
        echo "  Built by thousands of volunteers worldwide under GPL v2."
        ;;
    apache2)
        echo "  Apache: the web server that helped build the open internet."
        echo "  Licensed under Apache 2.0 — permissive and business-friendly."
        ;;
    mysql-server)
        echo "  MySQL: open-source database at the heart of millions of apps."
        echo "  Dual-licensed — a lesson in how open source meets commerce."
        ;;
    git)
        echo "  Git: Linus Torvalds built this when proprietary tools failed him."
        echo "  Licensed under GPL v2 — the same license as the Linux Kernel."
        ;;
    python3)
        echo "  Python: a language shaped entirely by its community under PSF."
        echo "  Proof that open governance produces world-class software."
        ;;
    *)
        echo "  Package: a part of the vast open-source ecosystem."
        echo "  Check its license at: https://spdx.org/licenses"
        ;;
esac

echo "========================================================"
