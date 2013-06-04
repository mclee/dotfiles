install: install-zsh install-git install-gem install-livereload install-ssh install-rbenv install-ackrc

install-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	ln -sf `pwd`/zshrc ~/.zshrc
	ln -sf `pwd`/zlogin ~/.zlogin
	ln -sf `pwd`/mclee.zsh-theme ~/.oh-my-zsh/themes/mclee.zsh-theme

install-git:
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/gitignore_global ~/.gitignore_global

install-gem:
	ln -sf `pwd`/gemrc ~/.gemrc

install-livereload:
	ln -sf `pwd`/livereload ~/.livereload

install-rvm:
	ln -sf `pwd`/rvmrc ~/.rvmrc
	ln -sf `pwd`/screenrc ~/.screenrc

install-ssh:
	mkdir -p ~/.ssh
	ln -sf `pwd`/ssh_config ~/.ssh/config

install-rbenv:
	git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	ln -sf default-gems ~/.rbenv/.

install-ackrc:
	ln -sf `pwd`/ackrc ~/.ackrc
