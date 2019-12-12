SHELL := /bin/bash
DOTS := ~/.dotfiles

.PHONY: all

all: backup bash vim

bash:
	ln -sfv $(DOTS)/bash_profile ~/.bash_profile;
	ln -sfv $(DOTS)/bashrc ~/.bashrc;
	ln -sfv $(DOTS)/bash_aliases ~/.bash_aliases;
	ln -sfv $(DOTS)/bash_prompt ~/.bash_prompt;
	ln -sfv $(DOTS)/bash_functions ~/.bash_functions;
	ln -sfv $(DOTS)/bash_logout ~/.bash_logout;
	ln -sfv $(DOTS)/tmux.conf ~/.tmux.conf
	ln -sfv $(DOTS)/htoprc ~/.htoprc
	mkdir -p ~/.Trash

vim:
	ln -sfv $(DOTS)/vimrc ~/.vimrc;
	vim +PlugInstall +qall;

backup:
	mkdir -p ~/old_dots
	mv ~/.bash* ~/old_dots/ || echo "No .bash* found"
	mv ~/.profile ~/old_dots/ || echo "No .profile found"
	mv ~/.vimrc ~/old_dots/ || echo "No .vimrc found"
	mv ~/.tmux.conf ~/old_dots/ || echo "No .tmux.conf found"
	mv ~/.htoprc ~/old_dots/ || echo "No .htoprc found"

