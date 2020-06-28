#!/bin/bash

temp_code=code.tmp
echo -n > "$temp_code"

while [ "x$1" != x ]; do
    filename="$1"
    length=`wc -c "$filename" | cut -d ' ' -f 1`
    binary_length=`echo "obase=2; $length" | bc`
    printf "%16d" $binary_length | tr ' ' 0
    cat "$filename" >> "$temp_code"
    shift
done

cat "$temp_code"
