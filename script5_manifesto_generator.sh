#!/bin/bash
# Script 5: Open Source Manifesto Generator

echo "Answer three questions to generate your manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo "On $DATE, I reflected on open source." > $OUTPUT
echo "I regularly use $TOOL, which represents collaboration." >> $OUTPUT
echo "To me, freedom means $FREEDOM." >> $OUTPUT
echo "In the future, I would build and freely share $BUILD." >> $OUTPUT

echo "Manifesto saved to $OUTPUT"
cat $OUTPUT
