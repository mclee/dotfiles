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
plugins=(git brew)

MACHINE=`uname`

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:$HOME/.rbenv/shims:/usr/local/sbin:$HOME/.cargo/bin:/usr/bin:/usr/local/bin:$HOME/bin:/usr/local/share/npm/bin:$HOME/gocode/bin:/usr/local/opt/go/libexec/bin
# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

alias vi="nvim"
alias vim="nvim"
alias edit="vim"
alias sync="/bin/sync;/bin/sync;/bin/sync"
alias p="ping"
alias n="/usr/bin/nslookup"
alias gindent="/usr/local/bin/gindent $1 $2 -i2 -bl -nce -bacc -nlp -di0"
alias indent="/usr/bin/indent $1 $2 -bbb -bap -lp -sob -nip -di2"
alias top="htop"
alias ls="ls -G"
alias ag="ag --pager=less"

export ENABLE_STARTUP_LOCALE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export ACK_PAGER="less -r"
export GOPATH="$HOME/gocode"

# A righteous umask
umask 22

# rbenv
eval "$(rbenv init - zsh)"

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
else
	if ! env |grep -q ^TMUX=; then
		ssh-add --apple-load-keychain
	fi
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# pyenv stuff
if [ $MACHINE = "Darwin" ]; then
	export PYENV_ROOT=/usr/local/var/pyenv
else
	export PYENV_ROOT="$HOME/.pyenv"
fi
export PATH="$PYENV_ROOT/shims:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# uname -r | grep -q rpi && source zshrc.retropie  # uncomment this to auto load retropie
