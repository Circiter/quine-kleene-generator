# Input: <length1><length2><argument1><argument2>
# Output: <length1><length1><argument1><argument1>

:xread $!{N; bxread}

s/$/\n/

s/^(................)(................)/\2@\1/ # Swap the length specifiers.

:xdelete_last_argument
    # Decrement argument's length.
    :xreplace_zero s/^([01]*)0(_*@)/\1_\2/; txreplace_zero
    s/^([01]*)1(_*@)/\10\2/
    :xrecover s/^([01]*)_(_*@)/\11\2/; txrecover

    s/.$// # Remove one character of the last argument
    /^0*@/! bxdelete_last_argument

s/^0*@// # Remove the length of the second argument.
# Pattern space: <length><first argument>

# Duplicate:
s/^(................)(.*)$/\1\1\2\2/
