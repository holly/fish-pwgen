set -g _pwgen_length            12
set -g _pwgen_count              1
set -g _pwgen_fold_char_length  82
set -g _pwgen_duplication_count  2
set -g _pwgen_lower_alphabets   "abcdefghijklmnoprstuvwxyz"
set -g _pwgen_upper_alphabets   (string upper $_pwgen_lower_alphabets)
set -g _pwgen_symbols           '.+*^$@%_<>{}#!/|;'
set -g _pwgen_numbers           "1234567890"
set -g _pwgen_anbiguous_strings "019lqIO"

function pwgen

    # -c  include uppercase
    # -A  exclude uppercase
    # -n  include number
    # -0  exclude number
    # -y  include symbol
    # -B  exclude 1,I,l,q,9,0,O
    argparse -n pwgen "v/version" "h/help" "A" "0" "y" "B"  -- $argv
    or return 1

    set -l pwgen_strings (string join "" $_pwgen_lower_alphabets $_pwgen_upper_alphabets $_pwgen_numbers)

    if set -lq _flag_version
        echo "pwgen, version 0.1"
        return
    end

    if test -n "$_flag_A"
        for c in (string split "" $_pwgen_upper_alphabets)
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_0"
        for c in (string split "" $_pwgen_numbers)
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_B"
        for c in (string split "" "$_pwgen_anbiguous_strings")
            set pwgen_strings  (string replace -a $c "" $pwgen_strings)
        end
    end
    if test -n "$_flag_y"
        set pwgen_strings  (string join "" $pwgen_strings $_pwgen_symbols)
    end

    set -l pwgen_length $_pwgen_length
    if test -n "$argv[1]"
        set pwgen_length $argv[1]
    end
    set -l pwgen_count $_pwgen_count
    if test -n "$argv[2]"
        set pwgen_count $argv[2]
    end

    set -l pws
    while true

        if test (count $pws) -eq $pwgen_count
            break
        end
        set -l pw ""
        set pw (_pwgen $pwgen_strings $pwgen_length)

        if test -z "$_flag_0"
           and not _is_include_numbers $pw
            continue
        end

        if test -n "$_flag_y"
           and not _is_include_syms $pw 
            continue
        end

        set -a pws $pw
    end
    echo $pws | fold -s -w $_pwgen_fold_char_length
end

function _is_include_numbers

    set -l str $argv[1]
    if test (string match -ra "[0-9]" $str | wc -l) -gt 0
        return 0
    end
    return 1
end

function _is_include_syms

    set -l str $argv[1]
    if test (string match -ra "[\.\+\*\^\$\@\%\_\<\>\{\}\#\!\/\|\;]" $str | wc -l) -gt 0
        return 0
    end
    return 1
end

function _last_str
    set -l str $argv[1]
    if test (string length $str) -eq 0
        echo ""
        return
    end
    string sub -s (string length $str) -l 1 $str
end

function _pwgen

    set -l pwgen_arr (string split "" $argv[1])
    set -l len $argv[2]
    set -l max_idx (count $pwgen_arr)
    set -l pw ""

    while true
        if test (string length $pw) -eq $len
            break
        end
        set -l str $pwgen_arr[(random 1 $max_idx)]

        # 連続して同じ値はやり直し
        if test $str = (_last_str $pw)
            continue
        end
        # 同じ文字が$_pwgen_duplication_count以上の場合はやり直し
        if test (string match -ra "(string escape -n $str)" $pw | wc -l) -gt $_pwgen_duplication_count
            continue
        end

        set pw (string join "" $pw $str)
    end
    echo $pw
end
