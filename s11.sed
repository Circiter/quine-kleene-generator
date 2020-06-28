# echo -n <x> > x.txt; echo -n <y> > y.txt
# ./construct_input.sh x.txt y.txt | sed -Ef ./p.sed > output1.txt
# ./construct_input.sh p.sed x.txt | sed -Ef s11.sed > generated.sed
# ./construct_input.sh y.txt | sed -Ef generated.sed > output2.txt
# diff output1.txt output2.txt

# Input: <length1><length2><argument1><argument2>

##################################

# [s11(p, x)](y)=[p](x, y)

##################################

:read $!{N; bread}

s/$/\n/

# Limitations:
# - The second argument can not contain a null character within.
# - The second argument must contain a \n character at the end.

# I. Read the first argument and create a new code-block based on it.
h; x
s/^................// # Remove the length of the first argument.

s/^................/&@/
:delete_last_argument
    # Decrement argument's length.
    :replace_zero_1 s/^([01]*)0(_*@)/\1_\2/; treplace_zero_1
    s/^([01]*)1(_*@)/\10\2/
    :recover_1 s/^([01]*)_(_*@)/\11\2/; trecover_1

    s/.$// # Remove one character of the last argument
    /^0*@/! bdelete_last_argument

s/^0*@// # Remove the length of the second argument.
# Hold space: <first argument>
x

s/^................/&@/
:delete_first_argument
    # Decrement argument's length.
    :replace_zero_2 s/^([01]*)0(_*@)/\1_\2/; treplace_zero_2
    s/^([01]*)1(_*@)/\10\2/
    :recover_2 s/^([01]*)_(_*@)/\11\2/; trecover_2

    s/^([01]*@................)./\1/ # Remove one character of the first argument.
    /^0*@/! bdelete_first_argument

s/^0*@// # Remove the first length specifier.
# Pattern space: <length><argument>

# Escape the second argument.
s/^(................)/\1$/ # Sentinel (for convenience).
s/@/\x00/g; s/$/@/ # A little hack.
:escape
    /^[01]*\$[\n\/\&\\\^\$\(\)\{\}\+\*\.\?\|\-\[]/ s/$/\\/
    /^[01]*\$\n/ s/^([01]*\$)./\1n/
    /^[01]*\$\]/ s/$/\\/ # FIXME: Why I have to write this line? Bug in the sed?
    s/^([01]*\$)([^@])(.*)$/\1\3\2/;
    /^[01]*\$@/! bescape
s/^([01]*)\$@/\1/; s/\x00/@/g

# II. Inject second argument (by creating a code that will append
# this fixed argument upfront of the yet-unspecified argument
# of the generated program).
s/^(................)(.*)$/s\/^\/\1\/; s\/^(................................)\/\\1\2\//;
# Pattern space: s/^/<length>/; s/^(................................)/\1<argument>/

# Append the code-block to complete our program.
G
# Pattern space: <injector>\n<program>
