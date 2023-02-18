#!/bin/bash

# Block bad bots based on user agents, IP addresses, and referrers

# Read user agents from ua.txt
while read -r user_agent; do
  iptables -A INPUT -p tcp --dport 80 -m string --string "$user_agent" --algo bm -j DROP
  iptables -A INPUT -p tcp --dport 443 -m string --string "$user_agent" --algo bm -j DROP
done < ua.txt

# Read IP addresses from ip.txt
while read -r ip_address; do
  iptables -A INPUT -s "$ip_address" -j DROP
done < ip.txt

# Read referrers from referer.txt
while read -r referrer; do
  iptables -A INPUT -p tcp --dport 80 -m string --string "$referrer" --algo bm -j DROP
  iptables -A INPUT -p tcp --dport 443 -m string --string "$referrer" --algo bm -j DROP
done < referer.txt
