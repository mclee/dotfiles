#!/bin/sh

DEST="$HOME/dotfiles"
MACHINE=`uname`

if [ $MACHINE != "Darwin" ]; then
	# setup git & zsh first
	sudo apt-get -y install zsh git
fi

if [ ! -d $DEST ]; then
	git clone https://github.com/mclee/dotfiles.git $DEST
fi

# install-zsh
if [ ! -d ~/.oh-my-zsh ]; then
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
ln -sf $DEST/zshrc ~/.zshrc
ln -sf $DEST/zshrc.general ~/.zshrc.general
if [ $MACHINE = "Linux" ]; then
	ln -sf $DEST/zshrc.linux ~/.zshrc.linux
fi
ln -sf $DEST/zlogin ~/.zlogin
ln -sf $DEST/mclee.zsh-theme ~/.oh-my-zsh/themes/mclee.zsh-theme

# install homebrew
if [ $MACHINE = "DARWIN" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(homebrew/bin/brew shellenv)"

	cat $DEST/brew.txt | xargs brew install
	cat $DEST/cask.txt | xargs brew install --cask
fi

# install tmux configs
if [ ! -d ~/.tmux ]; then
	git clone https://github.com/gpakosz/.tmux.git ~/.tmux
	ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
	ln -s $DEST/.tmux.conf.local ~/.
fi

# install-git
ln -sf $DEST/gitconfig ~/.gitconfig
ln -sf $DEST/gitignore_global ~/.gitignore_global

# intstall-gem
ln -sf $DEST/gemrc ~/.gemrc

# install-livereload
ln -sf $DEST/livereload ~/.livereload

# install-ssh
mkdir -p ~/.ssh
ln -sf $DEST/ssh_config ~/.ssh/config

# install-rbenv
if [ $MACHINE != "Darwin" ]; then

	# setup default packages first
	sudo apt-get update
	sudo apt-get -y install libssl-dev build-essential exuberant-ctags libreadline-dev imagemagick \
		libmysqlclient-dev byobu libpcre++-dev libxml2-dev libxslt1-dev htop neovim

	# install tsar
	git clone https://github.com/alibaba/tsar.git ~/tsar
	cd ~/tsar; make; sudo make install;
	cd ~;

	[ ! -d ~/.rbenv ] && git clone git://github.com/rbenv/rbenv.git ~/.rbenv
	[ ! -d ~/.rbenv/plugins/ruby-build ] && git clone git://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	[ ! -d ~/.rbenv/plugins/rbenv-aliases ] && git clone git://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
	[ ! -d ~/.rbenv/plugins/rbenv-default-gems ] && git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	[ ! -d ~/.rbenv/plugins/rbenv-gem-rehash ] && git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi
ln -sf $DEST/default-gems ~/.rbenv/.

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install-ackrc
ln -sf $DEST/ackrc ~/.ackrc

# install runnel setup file
[ ! -d ~/.runnel ] && mkdir -p ~/.runnel
ln -sf $DEST/tunnels.yml ~/.runnel/tunnels.yml

# install pyenv & nvm
if [ $MACHINE != "Darwin" ]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash #nvm
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv #pyenv
fi

# nvim
mkdir -p ~/.config/nvim
ln -sf $DEST/init.vim ~/.config/nvim/init.vim

# alacritty
[ ! -d ~/.config/alacritty ] && mkdir -p ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml
