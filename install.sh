#!/bin/sh

DEST="$HOME/dotfiles"
MACHINE=`uname`

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

# install-byobu
if [ ! -d ~/.byobu ]; then
	mkdir ~/.byobu
fi
ln -sf $DEST/profile.tmux ~/.byobu/profile.tmux

# install tmux-powerline
if [ ! -d ~/tmux-powerline ]; then
	git clone git://github.com/erikw/tmux-powerline.git ~/tmux-powerline
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
	sudo apt-get -y install libssl-dev build-essential ctags libreadline-dev imagemagick nodejs libmysqlclient-dev byobu libpcre++-dev libxslt1-dev

	[ ! -d ~/.rbenv ] && git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
	[ ! -d ~/.rbenv/plugins/ruby-build ] && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	[ ! -d ~/.rbenv/plugins/bundler ] && git clone git://github.com/carsomyr/rbenv-bundler.git ~/.rbenv/plugins/bundler
	[ ! -d ~/.rbenv/plugins/rbenv-aliases ] && git clone git://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
	[ ! -d ~/.rbenv/plugins/rbenv-default-gems ] && git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	[ ! -d ~/.rbenv/plugins/rbenv-gem-rehash ] && git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi
[ ! -d ~/.rbenv/plugins/rbenv-communal-gems ] && git clone git://github.com/tpope/rbenv-communal-gems.git ~/.rbenv/plugins/rbenv-communal-gems
[ ! -d ~/.rbenv/plugins/rbenv-sudo ] && git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo
[ ! -d ~/.rbenv/plugins/rbenv-ctags ] && git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
ln -sf $DEST/default-gems ~/.rbenv/.

# install-ackrc
ln -sf $DEST/ackrc ~/.ackrc

# install runnel setup file
[ ! -d ~/.runnel ] && mkdir -p ~/.runnel
ln -sf $DEST/tunnels.yml ~/.runnel/tunnels.yml
