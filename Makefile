tmux:
	ln -s ~/.dotfiles/tmux ~/.tmux
	ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

vim:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
	sudo pip3 uninstall greenlet
	sudo pip3 install neovim
	#sudo pip2 uninstall greenlet
	sudo pacman -S python-greenlet
	mkdir ~/.dotfiles/vim/.swp
	mkdir ~/.dotfiles/vim/.undo
	mkdir ~/.dotfiles/vim/.backup

git:
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

zsh:
	ln -s ~/.dotfiles/zsh ~/.zim
	zsh zimsetup.zsh
	rm ~/.zimrc
	ln -s ~/.dotfiles/zsh/.zimrc ~/.zimrc

i3:
	ln -s ~/.dotfiles/i3 ~/.config/i3

.PHONY: clean zsh git vim tmux i3
clean:
	rm -rf ~/.vim ~/.vimrc ~/.tmux ~/.tmux.conf ~/.gitconfig ~/.config/i3
	rm -rf ~/.zshrc ~/.zimrc ~/.zim ~/.zlogin

all: clean tmux vim git zsh i3
