#!/bin/bash


for item in *; 
do
	if [[ -d $item ]]; then
		noFiles=$(ls -l $item | wc -l)
		echo "$item is a directory containing " $noFiles " files"

	elif [[ -f $item ]]; then
		size=$(du -h $item)
    		echo "$item is a file of size: "$size
	else
    		echo "$item is not valid"
    	exit 1
	fi
done
