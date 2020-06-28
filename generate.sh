#!/bin/sh

echo 'Minification/compression of sed scripts...'
cat s11.sed | ./minifier.sed > s11.min.sed
cat duplicate-first.sed | ./minifier.sed > duplicate-first.min.sed

echo 'Generating a quine...'
./generate-q.sh

echo 'Executing the quine...'
echo hi > z.txt
./construct-input.sh z.txt | sed -Ef q.sed > q.sed.output

echo 'Comparing the output with the quine itself...'
diff q.sed q.sed.output

if [ $? = 0 ]; then
    echo 'Test passed. Quine is generated.'
else
    echo 'Test failed.'
fi
