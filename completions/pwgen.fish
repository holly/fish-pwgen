complete -c pwgen -s A --description " Exclude uppercase alphabets"
complete -c pwgen -s 0 --description " Exclude numbers"
complete -c pwgen -s y --description " Include symbols"
complete -c pwgen -s B --description " Exclude similar words (0,1,2,9,l,q,z,I,O,Z)"
complete -c pwgen -s h -x --description "Display help and exit"
complete -c pwgen -a (echo $__pwgen_length $__pwgen_number)
