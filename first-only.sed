# Input: <length1><length2><argument1><argument2>
# Output: <argument1>

:read $!{N; bread}
s/$/\n/
s/^................// # Remove the length of the first argument.
s/^................/&@/
:delete_last_argument
    # Decrement argument's length.
    :replace_zero_1 s/^([01]*)0(_*@)/\1_\2/; treplace_zero_1
    s/^([01]*)1(_*@)/\10\2/
    :recover_1 s/^([01]*)_(_*@)/\11\2/; trecover_1
    s/.$// # Remove one character of the last argument.
    /^0*@/! bdelete_last_argument
s/^0*@// # Remove the length of the second argument.
