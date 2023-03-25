config:
	rm -rf ~/.vimrc
	rm -rf ~/.vim
	rm -rf ~/.bashrc
	rm -rf ~/.config/tmux
	ln -s $(shell pwd)/.vimrc ~/.vimrc
	ln -s $(shell pwd)/.vim ~/.vim
	ln -s $(shell pwd)/.bashrc ~/.bashrc
	ln -s $(shell pwd)/tmux ~/.config/tmux
