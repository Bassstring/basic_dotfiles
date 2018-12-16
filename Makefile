SHELL = /bin/bash
DIR = $(shell pwd)

all: bash vim

bash:
	ln -sfv $(DIR)/bash_profile ~/.bash_profile;
	ln -sfv $(DIR)/bashrc ~/.bashrc;
	ln -sfv $(DIR)/bash_aliases ~/.bash_aliases;
	ln -sfv $(DIR)/bash_prompt ~/.bash_prompt;
	ln -sfv $(DIR)/bash_functions ~/.bash_functions;
	ln -sfv $(DIR)/bash_logout ~/.bash_logout;
	mkdir -p ~/.Trash

vim:
	ln -sfv $(DIR)/vimrc ~/.vimrc;
	vim +PlugInstall +qall;
