#!/bin/sh

# Usage: is-quine.sh <possibly_quine>

echo z > z.txt
./construct-input.sh z.txt | sed -Ef "$1" > output
diff "$1" output > /dev/null

if [ $? = 0 ]; then
    echo is a quine
else
    echo is not a quine
fi
