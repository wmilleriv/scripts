#!/bin/bash

name=$(basename $1)
name+=$(date -I)
cp $1 ./$name


