set -g __pwgen_length            12
set -g __pwgen_number            45
set -g __pwgen_fold_char_length  82
set -g __pwgen_duplication_count  2
set -g __pwgen_lower_alphabets   "abcdefghijklmnoprstuvwxyz"
set -g __pwgen_upper_alphabets   (string upper $__pwgen_lower_alphabets)
set -g __pwgen_symbols           '.+*^$@%_<>{}#!/|;'
set -g __pwgen_numbers           "1234567890"
set -g __pwgen_anbiguous_strings "019lqIO"
