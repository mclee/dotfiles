install: install-zsh install-git install-gem install-livereload install-rvm

install-zsh:
	ln -s `pwd`/zshrc ~/.zshrc

install-git:
	ln -s `pwd`/gitconfig ~/.gitconfig
	ln -s `pwd`/gitignore_global ~/.gitignore_global

install-gem:
	ln -s `pwd`/gemrc ~/.gemrc

install-livereload:
	ln -s `pwd`/livereload ~/.livereload

install-rvm:
	ln -s `pwd`/rvmrc ~/.rvmrc
	ln -s `pwd`/screenrc ~/.screenrc
