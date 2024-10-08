#!/bin/bash

LINES=$( cat $1 | wc -l )
R_LINE=$(($RANDOM % LINES))
sed -n "${R_LINE}p" $1 
