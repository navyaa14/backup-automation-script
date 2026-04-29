#!/bin/bash

TARGET="google.com"
PORT1="80"
PORT2="443"

REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/network_report.log"

mkdir -p "$REPORT_DIR"

echo "===== Network Troubleshooting Report =====" > "$REPORT_FILE"
echo "Time: $(date)" >> "$REPORT_FILE"
echo "Target: $TARGET" >> "$REPORT_FILE"
echo "=========================================" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "1. DNS Check" >> "$REPORT_FILE"
dig "$TARGET" +short >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "2. Ping Check" >> "$REPORT_FILE"
ping -c 4 "$TARGET" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "3. Route Check" >> "$REPORT_FILE"

IP=$(dig "$TARGET" +short | head -1)
ip route get "$IP" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "4. Port Check" >> "$REPORT_FILE"
nmap -p "$PORT1","$PORT2" "$TARGET" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "5. HTTP Check" >> "$REPORT_FILE"
curl -I "https://$TARGET" | head -1 >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Network check completed." >> "$REPORT_FILE"

echo "Report saved at: $REPORT_FILE"
