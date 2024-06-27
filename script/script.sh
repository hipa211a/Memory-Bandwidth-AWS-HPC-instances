#!/bin/bash

#in case of multiple memory domains use M0, M1 and so on - for AMD systems
#If it is a single memory single socket, like Graviton3, either M0 or S0 or D0 can be used as domain
#This for loop can be used for Graviton3
for ((i=1;i<=64;i++))
do
    likwid-bench -t triad_mem_avx_fma -w M0:2GB:$i 2>&1 | grep "MByte/s" | tee -a Graviton3-full-socket-bandwidth.txt
done