#!/bin/bash

# program name
exe_name=jcomcot

# set up numbers of threads
printf "please insert thread number:"
read thread_num
echo "thread_num you use in the simulation: $thread_num"

# export OMP_NUM_THREADS=8 (example)
export OMP_NUM_THREADS=$thread_num

# execute the program
#./$exe_name

# nohup
nohup ./$exe_name > my.log 2>&1 & echo $! > save_pid.txt

# update what the program is doing on the screen
tail -f my.log
