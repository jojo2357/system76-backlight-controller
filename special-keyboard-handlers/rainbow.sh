#!/bin/bash

if [ -z ${endColor+x} ]
then
	if [ -z ${2+x} ]
	then
		endColor="FF2000"
	else
		endColor=$2
	fi
fi

if pidof -o %PPID -x "rainbow.sh">/dev/null; then
	kill $(pgrep -f "rainbow.sh" | grep -v ^$$\$)
	echo "Killing duplicate"
	export-keyboard-color $endColor
	exit 0
fi

if [ -z ${1+x} ]
then
	speed="0.025"
else
	speed=$1
fi

while 
true
do
	for i in {1..255..4}; do
		iminusd=$((255 - $i))
		export-keyboard-color $iminusd $i 0
		sleep $speed
	done
	
	for i in {1..255..4}; do
		iminusd=$((255 - $i))
		export-keyboard-color 0 $iminusd $i
		sleep $speed
	done
	
	for i in {1..255..4}; do
		iminusd=$((255 - $i))
		export-keyboard-color $i 0 $iminusd
		sleep $speed
	done
done 
