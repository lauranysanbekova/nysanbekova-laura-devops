#!/bin/bash
# Nysanbekova_Laura_system.sh
# Студент және жүйе туралы ақпаратты шығарады

INFO_FILE="$HOME/devops/nysanbekova_laura/Nysanbekova_Laura_info.txt"

echo "=== Student Information ==="
echo "Name: Laura"
echo "Surname: Nysanbekova"
echo "Group: IT2-2309"
echo "Student ID: 37962"
echo

echo "=== System Information ==="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date '+%Y-%m-%d %H:%M:%S')"

if [ "$(uname)" = "Darwin" ]; then
    echo "Operating System: $(sw_vers -productName) $(sw_vers -productVersion) ($(uname -m))"
    echo "Kernel: $(uname -a)"
    echo "Disk Usage:"
    df -h
    echo "Memory Usage (vm_stat):"
    PAGE_SIZE=$(vm_stat | awk '/page size of/ {print $8}')
    FREE_PAGES=$(vm_stat | awk '/Pages free/ {gsub("\\.","",$3); print $3}')
    ACTIVE_PAGES=$(vm_stat | awk '/Pages active/ {gsub("\\.","",$3); print $3}')
    echo "  Free:   $((FREE_PAGES * PAGE_SIZE / 1024 / 1024)) MB"
    echo "  Active: $((ACTIVE_PAGES * PAGE_SIZE / 1024 / 1024)) MB"
    echo "  Total:  $(( $(sysctl -n hw.memsize) / 1024 / 1024 )) MB"
else
    echo "Operating System: $(uname -a)"
    echo "Disk Usage:"
    df -h
    echo "Memory Usage:"
    free -h
fi
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
