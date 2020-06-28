:read $!{N; bread}
s/$/\n/ # FIXME.
# Input: <8 bit length of argument 1><8 bit length of argument 2><argument 1><argument 2>
s/^................................// # Just leave the arguments (without length specifiers).
