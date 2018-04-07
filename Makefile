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
	rm ~/.gitconfig
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

xresources:
	rm ~/.Xresources
	ln -s ~/.dotfiles/.Xresources ~/.Xresources

zsh:
	ln -s ~/.dotfiles/zsh ~/.zim
	zsh zimsetup.zsh
	rm ~/.zimrc
	ln -s ~/.dotfiles/zsh/.zimrc ~/.zimrc

i3: dep
	ln -s ~/.dotfiles/i3 ~/.config/i3
	cd i3/conf/ && ./build.sh

mutt: dep
	ln -s ~/.dotfiles/mutt/.muttrc ~/.muttrc
	ln -s ~/.dotfiles/mutt/.mailcap ~/.mailcap


.PHONY: clean zsh git vim tmux i3
clean:
	rm -rf ~/.vim ~/.vimrc ~/.tmux ~/.tmux.conf ~/.gitconfig ~/.config/i3 ~/.muttrc
	rm -rf ~/.zshrc ~/.zimrc ~/.zim ~/.zlogin

dep:
	git clone https://aur.archlinux.org/powerline-fonts-git.git /tmp/powerline-font
	cd /tmp/powerline-font && makepkg -Acs && sudo pacman -U *.pkg.*
	git clone https://aur.archlinux.org/bumblebee-status-git.git /tmp/bumblebee
	cd /tmp/bumblebee && makepkg -Acs && sudo pacman -U *.pkg.*
	sudo pacman -S awesome-terminal-fonts perl-anyevent-i3 perl-json-xs w3m

all: clean tmux vim git zsh i3 mutt xresources
