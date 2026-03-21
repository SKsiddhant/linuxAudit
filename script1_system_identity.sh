#!/bin/bash
# Script 1: System Identity Report

STUDENT_NAME="Siddhant Kothiya"
SOFTWARE_CHOICE="Linux"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)
DATE=$(date)

echo "================================"
echo "  Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Uptime       : $UPTIME"
echo "Date & Time  : $DATE"
echo "License      : GNU General Public License (GPL)"
