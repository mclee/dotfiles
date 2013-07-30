# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mclee"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git brew bundler cap coffee osx rails4 redis-cli vundle)
plugins=(git brew rails4 vundle)

MACHINE=`uname`

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:$HOME/bin:/usr/local/share/npm/bin
alias vi="vim"
alias edit="vim"
alias sync="/bin/sync;/bin/sync;/bin/sync"
alias p="/bin/ping"
alias n="/usr/bin/nslookup"
alias gindent="/usr/local/bin/gindent $1 $2 -i2 -bl -nce -bacc -nlp -di0"
alias indent="/usr/bin/indent $1 $2 -bbb -bap -lp -sob -nip -di2"
alias top="htop"
alias ls="ls -G"

export ENABLE_STARTUP_LOCALE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export ACK_PAGER="less -r"

if [ $MACHINE = "Darwin" ]; then
	# homebrew byobu, only for OSX
	export BYOBU_PREFIX=$(brew --prefix)
	# autojump.sh
	[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

	# homebrew android-sdk
	ANDROID_HOME=/usr/local/opt/android-sdk
fi

# A righteous umask
umask 22

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# rbenvsudo
function rbenvsudo(){
	executable=$1
	shift 1
	sudo $(rbenv which $executable) $* 
}

# Other includes
if [ -f ~/.zshrc.general ]; then
	source ~/.zshrc.general
fi

# Below are some Linux stuff
#
if [ $MACHINE = "Linux" ] && [ -f ~/.zshrc.linux ]; then
	source ~/.zshrc.linux
fi
