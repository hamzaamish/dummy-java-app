#!/bin/bash

# Path to the log file
LOG_FILE="/var/log/app.log"

# Output file to store the summary
SUMMARY_FILE="/tmp/error_summary.txt"

# Email address to send notifications to
EMAIL="your-email@example.com"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file $LOG_FILE does not exist." >&2
  exit 1
fi

# Initialize error counters
ERROR_COUNT=0
WARN_COUNT=0
INFO_COUNT=0

# Process the log file and count occurrences of each error type
while IFS= read -r line; do
  if [[ "$line" == *"ERROR"* ]]; then
    ((ERROR_COUNT++))
  elif [[ "$line" == *"WARN"* ]]; then
    ((WARN_COUNT++))
  elif [[ "$line" == *"INFO"* ]]; then
    ((INFO_COUNT++))
  fi
done < "$LOG_FILE"

# Output the summary to the summary file
echo "Error Count: $ERROR_COUNT" > "$SUMMARY_FILE"
echo "Warn Count: $WARN_COUNT" >> "$SUMMARY_FILE"
echo "Info Count: $INFO_COUNT" >> "$SUMMARY_FILE"

# Check if any of the error counts exceeds 10 and send an email notification
if [ "$ERROR_COUNT" -gt 10 ]; then
  echo "ERROR count exceeds threshold! Sending email notification..." | mail -s "Error Threshold Exceeded" "$EMAIL"
elif [ "$WARN_COUNT" -gt 10 ]; then
  echo "WARN count exceeds threshold! Sending email notification..." | mail -s "Warn Threshold Exceeded" "$EMAIL"
elif [ "$INFO_COUNT" -gt 10 ]; then
  echo "INFO count exceeds threshold! Sending email notification..." | mail -s "Info Threshold Exceeded" "$EMAIL"
fi

# Output the summary to the console
cat "$SUMMARY_FILE"
