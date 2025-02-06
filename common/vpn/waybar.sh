#!/bin/bash

testname=$1

# Check if a hostname is provided
if [ -z "$1" ]; then
	echo "{\"text\": \"\", \"tooltip\":\"Error: Missing VPN test address\", \"class\":\"down\"}"
	exit 0
fi

# Resolve the hostname to an IP address using getent
ip_address=$(getent ahosts "$testname" | awk '{print $1; exit}')

# If no IP address is found, exit with an error
if [ -z "$ip_address" ]; then
	echo "{\"text\": \"\", \"tooltip\":\"No VPN connection\", \"class\":\"down\"}"
	exit 0
fi

# Check if there is a route to the IP address and filter for a PPP device
route_info=$(ip route get "$ip_address")

if echo "$route_info" | grep -q 'dev ppp'; then
	device=$(echo $route_info | awk '{print $3; exit}')
	host_ip=$(ip a | grep $device | grep -v : | awk '{print $4; exit}' | sed 's/\/.*//')
	tooltip=$(getent hosts "$host_ip" | awk '{print $2; exit}')
	echo "{\"text\": \"\", \"tooltip\":\"VPN connected to $tooltip\", \"class\":\"up\"}"
	exit 0
else
	echo "{\"text\": \"\", \"tooltip\":\"No VPN connection\", \"class\":\"down\"}"
	exit 0
fi

