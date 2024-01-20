#!/bin/bash

{
echo $(iperf3 -c 172.13.0.2 -t 1 -f m -J | jq -r '.end.sum_received.bits_per_second')
} >/root/iperf

#iperf client
