#!/bin/sh

echo 'generating e: [e](m, x)=s(m, m)'
./generate-e.sh

echo 'generating s11(e, e)'
./construct-input.sh e.sed e.sed | sed -Ef s11.min.sed > q.sed
