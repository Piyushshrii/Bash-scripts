#!/bin/bash
echo -e "\nDate & Time Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
date >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nMounted Filesystems:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
df -Th >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nBlock IDs Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
blkid >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nDisks Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
fdisk -l >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nBlock Storage Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
lsblk >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nVolume Groups Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
vgdisplay >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nLogical Volume Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
lvdisplay >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nMultipathing Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
multipath -ll >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nNetwork Interfaces:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
ifconfig -a >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nSystem Memory:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
free -m >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nUptime Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
uptime >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nGRUB Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
cat /etc/grub2.cfg >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nProcesses Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
ps -elf >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nResource Utilization & Processes Details:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
top -bn 1 >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nRouting Table Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
route -n >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

echo -e "\nFSTAB Information:" >> /root/"precheck_$(date +"%d-%m-%Y").txt"
cat /etc/fstab >> /root/"precheck_$(date +"%d-%m-%Y").txt" 2>&1

