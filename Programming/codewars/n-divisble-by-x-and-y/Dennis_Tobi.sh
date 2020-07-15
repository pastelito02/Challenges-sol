#!/bin/bash

n=$1; x=$2; y=$3
[[ $((n % x)) == 0 && $((n % y)) == 0 ]] && echo "true" || echo "false"
