#!/bin/bash

ls -l |awk '{print $9}'
cat $1 | sed -n 3p 


