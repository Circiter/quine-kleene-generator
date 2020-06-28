#!/bin/sed -Ef

# A crude, heuristical ad-hoc hack to compress a given sed script
# by removing all unnecessary code (empty lines, comments, etc).

# Usage example: cat script.sed | ./minifier.sed > script.min.sed

# Written specifically for the experiment with the generation of
# quines [1], and, currently, hardly usable in any other context.

# Refs.: [1] https://github.com/Circiter/quine-kleene-generator

# Written by Circiter (mailto:xcirciter@gmail.com)

# N.B., current version can not strip all of the comments.

:read $!{N; bread}

# Try to remove some of the comments (generally, this
# approach is highly incorrect one, but it works for
# my experiments with the quine generator).
s/^/\n/; s/$/\n/
:strip_comment
    s/\n[ \t]*#[^\n]*\n/\n/
    /\n[ \t]*#[^\n]*\n/bstrip_comment

# Delete all the empty lines.
:delete_line
    s/\n\n/\n/
    /\n\n./ bdelete_line

# Remove indentation (this particular implementation
# can broke many scripts).
:remove_indent
    s/\n[ \t][ \t]*([^ \t])/\n\1/
    /\n[ \t][ \t]*[^ \t]/ bremove_indent
