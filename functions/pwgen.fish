
function __pwgen_help

    echo 'fish-pwgen v0.0.1 (https://github.com/holly/fish-pwgen/)

Description:

  fish password generation function emurate to pwgen command (https://sourceforge.net/projects/pwgen/)

Usage:

  pwgen [option] [length] [number]

Options:

 -A        exclude uppercase alphabets
 -0        exclude numbers
 -y        include symbols
 -B        exclude similar words (1,I,l,q,9,0,O)
 
Example:

  # default. length:12 number:45.  password composed of alphabets and numbers
  > pwgen
    ZXC6eFXKrmNhAao8        ZRYecI456CBxwDWT        9pxlOzR9oU1zz7GX        gLLrmWwnC7F3RvFZ        0Ajfn48z581o1dK2        TOb7PhsoeowW92ve
    ytH789LpipKpAEeK        Iamy9WnjWyuYS7vP        1Xfti15drAo1NPG5        3uoy4712mRd4HJV9        ubYe1Vcgly7dmGj5        mCI1u9i3omZyEMSB
    p6sItkZ40za3uDgj        6O4SSZSZztGJvUrG        IDv7sAO5gPJ2k9XZ        9CM1JEstjDJ4AMwG        XRGF72vB5khopmzi        VzNDcXi1UfMEY5rX
    4hsAaoZ6uE9BX4KN        pcrdOSc1baDvwKy0        5UMOh4mStYGMTe3u        DMuf0lht2TvifCCP        yF301bnxLRxejsp4        Ub4H2AjTXVY2wDzG
    lHZ6mmVEXlYUACKp        alVMT3cKcYXdWVgY        KjMMRyGKJA5etcRi        ptbM9Mdl4cOAfSsn        uSh9k2vp69ffNmWu        rc8lbMZjstwnBuRH
    DbrjLeek1mglcWCP        tth0mYYkkaC10heM        hEhLSXv2ko84PIWN        nOyHsyRzBIHojXY2        pMsCkZv5Fo9p86z8        vlmXnhlKUssE2WI5
    0ekFW5OuGUOtIsEZ        NYSY5Y6vnjiOmtiv        RieS8M9DPAvd9WSN        rj1a8HMCMrhRMfLY        iGx3tYNTsmb9H4rO        0s2JDGvJlGitePpf

  # length:16 number:4 with symbols
  > pwgen -y 16 4
    jUPow8_j{ZX{1Mv$    LWkCN9Oos}!AYoV{    0Pa^W3S!a7>J5WSF    AjPp{M9+v;4wXkn6 

Copyright (C) 2023, holly.
'
end



function pwgen

    # -c  include uppercase
    # -A  exclude uppercase
    # -n  include number
    # -0  exclude number
    # -y  include symbol
    # -B  exclude 1,I,l,q,9,0,O
    argparse -n pwgen "v/version" "h/help" "A" "0" "y" "B"  -- $argv
    or return 1

    set -l pwgen_strings (string join "" $__pwgen_lower_alphabets $__pwgen_upper_alphabets $__pwgen_numbers)

    if set -lq _flag_version
        echo "pwgen, version 0.1"
        return 0
    end

    if test -n "$_flag_h"
        __pwgen_help
        return 0
    end

    if test -n "$_flag_A"
        for c in (string split "" $__pwgen_upper_alphabets)
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_0"
        for c in (string split "" $__pwgen_numbers)
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_B"
        for c in (string split "" "$__pwgen_anbiguous_strings")
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_y"
        set pwgen_strings  (string join "" $pwgen_strings $__pwgen_symbols)
    end

    set -l pwgen_length $__pwgen_length
    if test -n "$argv[1]"
        set pwgen_length $argv[1]
    end
    set -l pwgen_number $__pwgen_number
    if test -n "$argv[2]"
        set pwgen_number $argv[2]
    end


    set -l passwords
    while test (count $passwords) -ne $pwgen_number

        set -l password (env LC_ALL=C tr -dc "$pwgen_strings" </dev/urandom | fold -w $pwgen_length | head -n 1)

        if test -z "$_flag_0"
           and not __pwgen_is_include_numbers $password
            continue
        end

        if test -n "$_flag_y"
           and not __pwgen_is_include_syms $password
            continue
        end

        set -a passwords $password
    end
    #printf "%s\n" $passwords | column -x | string replace -a "\t" " "
    printf "%s\n" $passwords 
end

function __pwgen_is_include_numbers

    set -l str $argv[1]
    if test (string match -ra "[0-9]" $str | wc -l) -gt 0
        return 0
    end
    return 1
end

function __pwgen_is_include_syms

    set -l str $argv[1]
    if test (string match -ra "[\.\+\*\^\$\@\%\_\<\>\{\}\#\!\/\|\;]" $str | wc -l) -gt 0
        return 0
    end
    return 1
end
