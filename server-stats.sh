#!/bin/bash

echo "==== CPU Usage ===="
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo -e "\n==== Memory Usage ===="
free -m | awk 'NR==2{used=$3; total=$2; printf "Total: %s MB | Used: %s MB | Free: %s MB | Usage: %.2f%%\n", total, used, $4, (used/total)*100}'

echo -e "\n==== Disk Usage ===="
df -h --total | awk '/^total/ {print "Total Disk: "$2" | Used: "$3" | Free: "$4" | Usage: "$5}'

echo -e "\n==== Top 5 Processes by CPU ===="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n==== Top 5 Processes by Memory ===="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo -e "\n==== OS Version ===="
cat /etc/os-release | grep PRETTY_NAME

echo -e "\n==== Uptime ===="
uptime -p

echo -e "\n==== Load Average ===="
uptime | awk -F'load average: ' '{print $2}'

echo -e "\n==== Logged-in Users ===="
who