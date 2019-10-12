urlview:
	rm ~/.urlview || true
	ln -s ~/.dotfiles/.urlview ~/.urlview
tmux:
	git submodule init
	git submodule update
	ln -s ~/.dotfiles/tmux ~/.tmux
	ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

vim:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
	# sudo pip3 uninstall greenlet
	sudo pip3 install neovim
	#sudo pip2 uninstall greenlet
	sudo pacman -S python-greenlet
	mkdir -p ~/.dotfiles/vim/.swp
	mkdir -p ~/.dotfiles/vim/.undo
	mkdir -p ~/.dotfiles/vim/.backup

git:
	rm ~/.gitconfig || echo
	rm ~/.gitmessage || echo
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/.gitmessage ~/.gitmessage

xresources:
	rm ~/.Xresources
	ln -s ~/.dotfiles/.Xresources ~/.Xresources
xcompose:
	rm ~/.XCompose || true
	ln -s ~/.dotfiles/.XCompose ~/.XCompose

albert:
	ln -s ~/.dotfiles/albert ~/.config/albert

zsh: dep
	cd ~/.dotfiles/zsh/ && git submodule init && git submodule update --recursive
	rm ~/.zim || echo
	ln -s ~/.dotfiles/zsh ~/.zim
	cd ~/.dotfiles
	zsh zimsetup.zsh
	rm ~/.zimrc || echo
	rm ~/.zshrc || echo
	ln -s ~/.dotfiles/.zimrc ~/.zimrc
	ln -s ~/.dotfiles/.zshrc ~/.zshrc

compton:
	ln -s ~/.dotfiles/.compton.conf ~/.compton.conf

i3: dep
	ln -s ~/.dotfiles/i3 ~/.config/i3
	cd i3/conf/ && ./build.sh

.PHONY: clean zsh git vim tmux i3 albert
clean:
	rm -rf ~/.vim ~/.vimrc ~/.tmux ~/.tmux.conf ~/.gitconfig ~/.config/i3
	rm -rf ~/.zshrc ~/.zimrc ~/.zim ~/.zlogin ~/.compton.conf
	rm -rf ~/.mailcap ~/.zsh 
	rm -rf ~/.config/albert
	rm -rf /tmp/makedir/

dep:
	git clone https://aur.archlinux.org/powerline-fonts-git.git /tmp/makedir/powerline-font
	cd /tmp/makedir/powerline-font && makepkg -Acsi
	git clone https://aur.archlinux.org/bumblebee-status-git.git /tmp/makedir/bumblebee
	cd /tmp/makedir/bumblebee && makepkg -Acsi
	sudo pacman -S awesome-terminal-fonts perl-anyevent-i3 perl-json-xs w3m fzf fd

all: clean i3 zsh compton xcompose xresources albert git vim tmux urlview
