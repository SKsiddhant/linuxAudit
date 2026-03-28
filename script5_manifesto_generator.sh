#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Siddhant Kothiya | Roll: 24bce10109
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Interactively asks the user three questions and generates
#              a personalised open-source philosophy statement, saving it
#              to a .txt file.
# Concepts: read for user input, string concatenation, writing to file
#           with >, date command, aliases demonstrated via comment

# --- Alias concept note ---
# In a shell session you could run: alias today='date +%d-%B-%Y'
# This script achieves the same result using a variable instead.

echo "========================================================"
echo "       Open Source Manifesto Generator"
echo "========================================================"
echo "  Student: Siddhant Kothiya | Roll: 24bce10109"
echo "  Software Audited: Linux Kernel"
echo "--------------------------------------------------------"
echo "  Answer three questions to generate your manifesto."
echo ""

# --- Prompt the user for three inputs using 'read' ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Capture current date using the date command ---
DATE=$(date '+%d %B %Y')

# --- Build the output filename using string concatenation ---
OUTPUT="manifesto_$(whoami).txt"

# --- Write the header to the file using > (overwrite) ---
echo "========================================" > "$OUTPUT"
echo "   My Open Source Manifesto" >> "$OUTPUT"
echo "   $DATE" >> "$OUTPUT"
echo "   By: Siddhant Kothiya (24bce10109)" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose the manifesto paragraph by concatenating variables ---
MANIFESTO="Every day, I rely on $TOOL — a tool built not for profit, but for people."
MANIFESTO="$MANIFESTO To me, freedom means $FREEDOM, and open source is the closest"
MANIFESTO="$MANIFESTO software comes to embodying that. The Linux Kernel taught me that"
MANIFESTO="$MANIFESTO great things are built when knowledge is shared, not hoarded."
MANIFESTO="$MANIFESTO One day, I hope to build $BUILD and release it freely,"
MANIFESTO="$MANIFESTO so that someone else can stand on my shoulders, just as I have"
MANIFESTO="$MANIFESTO stood on the shoulders of Linus Torvalds and thousands of contributors."

# --- Write the manifesto paragraph to the file using >> (append) ---
echo "$MANIFESTO" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Confirm and display the saved manifesto ---
echo "  Manifesto saved to: $OUTPUT"
echo "--------------------------------------------------------"
cat "$OUTPUT"
echo "========================================================"
