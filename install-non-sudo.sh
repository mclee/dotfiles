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
if [ $MACHINE = "DARWIN" ]; then
	if [ ! -d ~/.byobu ]; then
		mkdir ~/.byobu
	fi
	ln -sf $DEST/profile.tmux ~/.byobu/profile.tmux
	ln -sf $DEST/.tmux.conf ~/.byobu/.tmux.conf
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

	[ ! -d ~/.rbenv ] && git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
	[ ! -d ~/.rbenv/plugins/ruby-build ] && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	[ ! -d ~/.rbenv/plugins/rbenv-aliases ] && git clone git://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
	[ ! -d ~/.rbenv/plugins/rbenv-default-gems ] && git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	[ ! -d ~/.rbenv/plugins/rbenv-gem-rehash ] && git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi
[ ! -d ~/.rbenv/plugins/rbenv-communal-gems ] && git clone git://github.com/tpope/rbenv-communal-gems.git ~/.rbenv/plugins/rbenv-communal-gems
[ ! -d ~/.rbenv/plugins/rbenv-sudo ] && git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo
[ ! -d ~/.rbenv/plugins/rbenv-ctags ] && git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
[ ! -d ~/.rbenv/plugins/rbenv-update ] && git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
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
