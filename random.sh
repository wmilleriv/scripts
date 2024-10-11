#!/bin/bash

let "range = $2 - $1 + 1"

let "num = $RANDOM % range + $1"

echo $num

