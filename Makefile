FISH_CONFIG_PATH ?= ${HOME}/.config/fish

all:

install:

	install -d ${FISH_CONFIG_PATH}/functions
	install functions/pwgen.fish ${FISH_CONFIG_PATH}/functions
	install -d ${FISH_CONFIG_PATH}/conf.d
	install conf.d/pwgen.fish ${FISH_CONFIG_PATH}/conf.d

uninstall:

	rm -f ${FISH_CONFIG_PATH}/functions/bd.fish
	rm -f ${FISH_CONFIG_PATH}/conf.d/bd.fish

.PHONY: all install uninstall
