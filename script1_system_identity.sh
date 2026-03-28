#!/bin/bash
# Script 1: System Identity Report
# Author: Siddhant Kothiya | Roll: 24bce10109
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Displays a welcome screen with key system information,
#              including kernel version, user, uptime, distro, and license.

# --- Variables ---
STUDENT_NAME="Siddhant Kothiya"
ROLL_NUMBER="24bce10109"
SOFTWARE_CHOICE="Linux Kernel"

# --- Gather system info using command substitution $() ---
KERNEL=$(uname -r)                         # Current running kernel version
USER_NAME=$(whoami)                        # Logged-in username
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable uptime
DATETIME=$(date '+%d %B %Y, %I:%M %p')    # Formatted current date and time

# --- Detect Linux distribution from /etc/os-release ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -oP '(?<=^PRETTY_NAME=").*(?=")' /etc/os-release)
else
    DISTRO="Unknown Distribution"
fi

# --- Display the system identity report ---
echo "========================================================"
echo "       Open Source Audit — System Identity Report"
echo "========================================================"
echo "  Student      : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Software     : $SOFTWARE_CHOICE"
echo "--------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo "--------------------------------------------------------"
# The Linux Kernel is licensed under GPL v2 — source must remain open
echo "  OS License   : GNU General Public License v2 (GPL v2)"
echo "========================================================"
