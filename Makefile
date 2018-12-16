SHELL = /bin/bash
DIR = $(shell pwd)

.PHONY: all

all: backup bash vim

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

backup:
	mkdir -p ~/old_dots
	mv ~/.bash* ~/old_dots/ || echo "No .bash* found"
	mv ~/.profile ~/old_dots/ || echo "No .profile found"
	mv ~/.vimrc ~/old_dots/ || echo "No .vimrc found"
