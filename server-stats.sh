#!/bin/bash

echo "===== SERVER STATS REPORT ====="

# CPU usage
echo -e "\n-- Total CPU Usage --"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'

# Memory usage
echo -e "\n-- Memory Usage --"
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

# Disk usage
echo -e "\n-- Disk Usage --"
df -h --total | awk '/total/ {print "Used: "$3 " / Total: "$2 " (" $5 " used)"}'

# Top 5 CPU-consuming processes
echo -e "\n-- Top 5 Processes by CPU Usage --"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 memory-consuming processes
echo -e "\n-- Top 5 Processes by Memory Usage --"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
