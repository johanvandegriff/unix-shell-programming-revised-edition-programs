#!/bin/bash
input="$1"
output="$2"

convert "$input" -background white -flatten -negate -threshold 50% -transparent black "$output"
