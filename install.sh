#!/bin/sh

DEST="~/dotfiles"
git clone https://github.com/mclee/dotfiles.git $DEST

# install-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
ln -sf $DEST/zshrc ~/.zshrc
ln -sf $DEST/zlogin ~/.zlogin
ln -sf $DEST/mclee.zsh-theme ~/.oh-my-zsh/themes/mclee.zsh-theme

# install-byobu
if [ ! -d ~/.byobu ]; then
	mkdir ~/.byobu
fi
ln -sf $DEST/profile.tmux ~/.byobu/profile.tmux

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
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
ln -sf $DEST/default-gems ~/.rbenv/.

# install-ackrc
ln -sf $DEST/ackrc ~/.ackrc
