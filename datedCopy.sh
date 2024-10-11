#!/bin/bash
stamp=$(date -I)
basename -a $@ | xargs -i mv {} {}$stamp  




