#!/bin/bash

for i in {1..100000}
do
	sudo tcpkill -i wlp3s0 port $i &
done
