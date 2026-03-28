#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE=$1

if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed."
    dpkg -l | grep $PACKAGE
else
    echo "$PACKAGE is NOT installed."
fi

case $PACKAGE in
    apache2) echo "Apache: Web server powering the internet" ;;
    mysql) echo "MySQL: Database used worldwide" ;;
    git) echo "Git: Version control system" ;;
    python3) echo "Python: Programming language" ;;
    *) echo "Unknown package" ;;
esac
