#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="bash"

if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed."
    dpkg -l | grep $PACKAGE
else
    echo "$PACKAGE is NOT installed."
fi

case $PACKAGE in
    apache2) echo "Apache: the web server that built the open internet" ;;
    mysql) echo "MySQL: open source database powering many applications" ;;
    vlc) echo "VLC: multimedia player that plays almost all formats" ;;
    firefox) echo "Firefox: browser promoting open web standards" ;;
    bash) echo "Bash: command-line shell used in Linux systems" ;;
    *) echo "Unknown package" ;;
esac
