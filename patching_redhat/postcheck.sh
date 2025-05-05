#!/bin/bash

# Output File
LOG_FILE="/root/postcheck_$(date +"%d-%m-%Y").txt"

# Start Logging
echo -e "\nDate & Time Information:" >> "$LOG_FILE"
date >> "$LOG_FILE" 2>&1

echo -e "\nMounted Filesystems:" >> "$LOG_FILE"
df -Th >> "$LOG_FILE" 2>&1

echo -e "\nBlock IDs Information:" >> "$LOG_FILE"
blkid >> "$LOG_FILE" 2>&1

echo -e "\nDisks Information:" >> "$LOG_FILE"
fdisk -l >> "$LOG_FILE" 2>&1

echo -e "\nBlock Storage Information:" >> "$LOG_FILE"
lsblk >> "$LOG_FILE" 2>&1

echo -e "\nVolume Groups Information:" >> "$LOG_FILE"
vgdisplay >> "$LOG_FILE" 2>&1

echo -e "\nLogical Volume Information:" >> "$LOG_FILE"
lvdisplay >> "$LOG_FILE" 2>&1

echo -e "\nMultipathing Information:" >> "$LOG_FILE"
multipath -ll >> "$LOG_FILE" 2>&1

echo -e "\nNetwork Interfaces:" >> "$LOG_FILE"
ifconfig -a >> "$LOG_FILE" 2>&1

echo -e "\nSystem Memory:" >> "$LOG_FILE"
free -m >> "$LOG_FILE" 2>&1

echo -e "\nUptime Information:" >> "$LOG_FILE"
uptime >> "$LOG_FILE" 2>&1

echo -e "\nGRUB Information:" >> "$LOG_FILE"
cat /etc/grub2.cfg >> "$LOG_FILE" 2>&1

echo -e "\nProcesses Information:" >> "$LOG_FILE"
ps -elf >> "$LOG_FILE" 2>&1

echo -e "\nResource Utilization & Processes Details:" >> "$LOG_FILE"
top -bn 1 >> "$LOG_FILE" 2>&1

echo -e "\nRouting Table Information:" >> "$LOG_FILE"
route -n >> "$LOG_FILE" 2>&1

echo -e "\nFSTAB Configuration File:" >> "$LOG_FILE"
cat /etc/fstab >> "$LOG_FILE" 2>&1

