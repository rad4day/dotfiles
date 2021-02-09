tmux:
	git submodule init
	git submodule update
	ln -s ~/.dotfiles/tmux ~/.tmux
	ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

vim:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
	sudo pip3 install neovim
	sudo pacman -S python-greenlet || true
	mkdir -p ~/.dotfiles/vim/.swp
	mkdir -p ~/.dotfiles/vim/.undo
	mkdir -p ~/.dotfiles/vim/.backup

git:
	rm ~/.gitconfig || echo
	rm ~/.gitmessage || echo
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/.gitmessage ~/.gitmessage

gnupg:
	for i in $(ls gnupg -1); do rm ~/.gnupg/$i; ln -s ~/.dotfiles/gnupg/$i ~/.gnupg/$i; done

zsh:
	rm -rf ~/.zim || true
	cd ~/.dotfiles
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	rm ~/.zimrc || true
	rm ~/.zshrc || true
	ln -s ~/.dotfiles/.zimrc ~/.zimrc
	ln -s ~/.dotfiles/.zshrc ~/.zshrc

compton:
	ln -s ~/.dotfiles/.compton.conf ~/.compton.conf

i3: dep
	ln -s ~/.dotfiles/i3 ~/.config/i3
	cd i3/conf/ && ./build.sh

.PHONY: clean zsh git vim tmux i3 albert gnupg
clean:
	rm -rf ~/.vim ~/.vimrc ~/.tmux ~/.tmux.conf ~/.gitconfig ~/.config/i3
	rm -rf ~/.zshrc ~/.zimrc ~/.zim ~/.zlogin ~/.compton.conf
	rm -rf ~/.mailcap ~/.zsh
	rm -rf ~/.config/albert
	rm -rf /tmp/makedir/

all: clean zsh git vim tmux
