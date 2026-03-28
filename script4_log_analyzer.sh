#!/bin/bash
# Script 4: Log File Analyzer
# Author: Siddhant Kothiya | Roll: 24bce10109
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Reads a log file line by line, counts occurrences of a keyword,
#              retries if file is empty, and prints the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# Concepts: while-read loop, if-then, counter variables, $1/$2 arguments, tail+grep

# --- Accept log file path and keyword as command-line arguments ---
LOGFILE=$1
KEYWORD=${2:-"error"}    # Default keyword is 'error' if not provided

echo "========================================================"
echo "              Log File Analyzer"
echo "========================================================"
echo "  Student: Siddhant Kothiya | Software: Linux Kernel"
echo "--------------------------------------------------------"

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    exit 1
fi

# --- Check that the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    exit 1
fi

# --- Retry loop: if file is empty, wait and check again (do-while style) ---
MAX_RETRIES=3
RETRY=0
while [ ! -s "$LOGFILE" ]; do
    RETRY=$((RETRY + 1))
    echo "  WARNING: '$LOGFILE' is empty. Retry $RETRY of $MAX_RETRIES..."
    sleep 1
    if [ "$RETRY" -ge "$MAX_RETRIES" ]; then
        echo "  File remains empty after $MAX_RETRIES retries. Exiting."
        exit 1
    fi
done

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "--------------------------------------------------------"

# --- Count keyword matches by reading file line by line ---
COUNT=0
while IFS= read -r LINE; do
    # -i for case-insensitive match; -q suppresses output (just checks true/false)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter each time keyword is found
    fi
done < "$LOGFILE"

echo "  Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo "--------------------------------------------------------"

# --- Print the last 5 lines that contain the keyword ---
echo "  Last 5 matching lines:"
echo ""
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)
if [ -z "$MATCHES" ]; then
    echo "  (no matching lines found)"
else
    # Print each matching line with an indent
    echo "$MATCHES" | while IFS= read -r line; do
        echo "    $line"
    done
fi

echo "========================================================"
