set -g _pwgen_length            12
set -g _pwgen_number             1
set -g _pwgen_fold_char_length  82
set -g _pwgen_duplication_count  2
set -g _pwgen_lower_alphabets   "abcdefghijklmnoprstuvwxyz"
set -g _pwgen_upper_alphabets   (string upper $_pwgen_lower_alphabets)
set -g _pwgen_symbols           '.+*^$@%_<>{}#!/|;'
set -g _pwgen_numbers           "1234567890"
set -g _pwgen_anbiguous_strings "019lqIO"
