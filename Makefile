install: install-zsh install-git install-gem install-livereload install-rvm install-ssh

install-zsh:
	ln -sf `pwd`/zshrc ~/.zshrc

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
