# quine-kleene-generator

A collection of shell scripts as well as a sed scripts allowing the generation of a quine (a 
program that prints itself), written in the input language of [GNU] "sed" the infamous stream 
editor.

This generator internally uses the proof of Kleene's second recursion theorem. One drawback is 
that such a quine is catastrophically inefficient, large, and slow.

## Usage

There are several shell-scripts implementing a different stages of the Kleene's proof. You 
can use them individually or, instead, you can at once run a whole testing process by executing 
the script `generate.sh`. It uses the `construct-input.sh` to create a data-packets holding an 
arguments to some of the sed script in the repository. Also it uses the `minifier.sed` to 
compress some scripts a little bit, and then it sequentially executes `generate-e.sh` and 
`generate-q.sh` creating the quine `q.sed` along the way and testing it with the `is-quine.sh`. 
Simple.

(Also, there are some example files, like `first-only.sed`, `concat.sed`, `is-quine.sh`, and 
may be a few other.)

For details, see the actual source code. :)

(c) Circiter (mailto:xcirciter@gmail.com)
License: MIT.
