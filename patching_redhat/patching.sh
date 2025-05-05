#!/bin/bash

# Script Name: yum_patching.sh
# Description: Automates the Linux patching process using YUM
# Author: Piyush Shrivastava
# Date: $(date +'%d-%m-%Y')

LOGFILE="/root/yum_patch_$(date +'%d-%m-%Y').log"

echo "=== Linux YUM Patching Started: $(date) ===" | tee -a $LOGFILE

echo -e "\n>> Cleaning YUM cache..." | tee -a $LOGFILE
yum clean all >> $LOGFILE 2>&1

echo -e "\n>> Listing all enabled repositories..." | tee -a $LOGFILE
yum repolist all >> $LOGFILE 2>&1

echo -e "\n>> Checking for updates..." | tee -a $LOGFILE
yum check-update >> $LOGFILE 2>&1

echo -e "\n>> Listing all available packages..." | tee -a $LOGFILE
yum list all >> $LOGFILE 2>&1

echo -e "\n>> Updating podman package..." | tee -a $LOGFILE
yum update -y podman >> $LOGFILE 2>&1

echo -e "\n>> Verifying podman installation..." | tee -a $LOGFILE
yum list installed podman >> $LOGFILE 2>&1
rpm -qi podman >> $LOGFILE 2>&1

echo -e "\n>> Downgrading podman package..." | tee -a $LOGFILE
yum downgrade -y podman >> $LOGFILE 2>&1

echo -e "\n>> Displaying YUM history..." | tee -a $LOGFILE
yum history >> $LOGFILE 2>&1
yum history info >> $LOGFILE 2>&1
yum history info 1 >> $LOGFILE 2>&1
yum history info 2 >> $LOGFILE 2>&1

echo -e "\n>> Checking if zsh is installed..." | tee -a $LOGFILE
yum list installed zsh >> $LOGFILE 2>&1 || {
  echo ">> Installing zsh..." | tee -a $LOGFILE
  yum install -y zsh >> $LOGFILE 2>&1
}

echo -e "\n>> Verifying zsh installation..." | tee -a $LOGFILE
yum list installed zsh >> $LOGFILE 2>&1

echo -e "\n>> Displaying full YUM history again..." | tee -a $LOGFILE
yum history >> $LOGFILE 2>&1
yum history info >> $LOGFILE 2>&1
yum history info 6 >> $LOGFILE 2>&1

echo -e "\n>> Attempting to undo transaction 6 (if exists)..." | tee -a $LOGFILE
yum history undo 6 >> $LOGFILE 2>&1 || echo "Transaction 6 not found or cannot be undone." | tee -a $LOGFILE

echo -e "\n>> Rechecking zsh installation status..." | tee -a $LOGFILE
yum list installed zsh >> $LOGFILE 2>&1

echo -e "\n>> Final full system update..." | tee -a $LOGFILE
yum update -y >> $LOGFILE 2>&1

echo -e "\n>> Rebooting system now..." | tee -a $LOGFILE
echo "=== Linux YUM Patching Completed: $(date) ===" | tee -a $LOGFILE
reboot

