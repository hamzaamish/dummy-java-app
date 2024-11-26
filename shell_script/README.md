ps to Use the Script:
Create the Shell Script:

Open a terminal.
Create a new script file using a text editor like nano:
bash
Copy code
nano log_processor.sh
Copy and paste the above script into the file.
Make the Script Executable:

Save the file (Ctrl + O, Enter, and then Ctrl + X to exit).
Make the script executable:
bash
Copy code
chmod +x log_processor.sh
Run the Script:

Run the script:
bash
Copy code
./log_processor.sh
The script will:

Count occurrences of ERROR, WARN, and INFO in the /var/log/app.log.
Output the count summary to /tmp/error_summary.txt.
If any count exceeds 10, an email will be sent to the address provided in the script.
Key Notes:
Email Notifications: The script uses the mail command to send notifications. Ensure that your system has an email utility set up (e.g., mail, sendmail, or msmtp).
Log File Location: You may need to adjust the LOG_FILE path if the log file is in a different location or if permissions prevent the script from accessing it.
Permissions: Ensure that the script has the necessary permissions to read the log file and send emails.
Let me know if you need further adjustments or explanations!
