#!/bin/bash

# Read user agents from ua.txt
while read -r user_agent; do
  iptables -A INPUT -p tcp --dport 80 -m string --string "$user_agent" --algo bm -j DROP
  iptables -A INPUT -p tcp --dport 443 -m string --string "$user_agent" --algo bm -j DROP
  echo "Blocking user agent: $user_agent"
done < ua.txt

# Read IP addresses from ip.txt
while read -r ip_address; do
  iptables -A INPUT -s "$ip_address" -j DROP
  echo "Blocking IP address: $ip_address"
done < ip.txt

# Read referrers from referer.txt
while read -r referrer; do
  iptables -A INPUT -p tcp --dport 80 -m string --string "$referrer" --algo bm -j DROP
  iptables -A INPUT -p tcp --dport 443 -m string --string "$referrer" --algo bm -j DROP
  echo "Blocking referrer: $referrer"
done < referer.txt

echo "Done Progress"
