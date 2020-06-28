#!/bin/sh

cat duplicate-first.min.sed > e.sed
echo 's/\n$//' >> e.sed # FIXME.
cat s11.min.sed >> e.sed
