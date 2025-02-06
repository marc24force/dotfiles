#!/bin/bash

usage() {
	echo "$0 [start|stop|toggle]"
}

get_status() {
	awk '{print $1}' "$status_file"
}

get_pid() {
	awk -F'[()]' '{print $2}' "$status_file"
}

try() {
  "$1"
  if [[ $? -eq 0 ]]; then
    "$2"
  fi
}

vpndir=$HOME/.config/vpn
status_file=$vpndir/.status
cmd=$1

if [[ -z "$1" || "$1" == "toggle" ]]; then
	if [ $(get_status) == "down" ]; then
		cmd="start"
	else
		cmd="stop"
	fi
fi

if [[ ! -f $status_file ]]; then
	echo "down" > $status_file
fi

case "$cmd" in
	start) 
		if [ $(get_status) == "up" ]; then
			echo "vpn already running"
			exit 0
		fi
		sudo openfortivpn -c ~/.config/vpn/config &> /dev/null &
		PID=$!
		disown
		wait $PID
		if [[ $? -eq 0 ]]; then
			echo "up ($PID)" > $status_file
		fi
		;;
	stop)
		if [ $(get_status) == "down" ]; then
			echo "no vpn running"
			exit 0
		fi
		PID=$(get_pid)
		kill $PID
		if [[ $? -eq 0 ]]; then
			echo "down" > $status_file
		fi
		;;
	*)
		echo "Error! Wrong command"
		usage
		exit 1
		;;
esac

cat $status_file
