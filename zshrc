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
plugins=(git brew cake osx rails3 ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/local/Cellar/ruby/1.9.3-head/bin:/usr/bin:/usr/local/sbin:$HOME/bin
export BYOBU_PREFIX=`brew --prefix`
alias vi="vim"
alias edit="vim"
alias sync="/bin/sync;/bin/sync;/bin/sync"
alias p="/bin/ping"
alias n="/usr/bin/nslookup"
alias gindent="/usr/local/bin/gindent $1 $2 -i2 -bl -nce -bacc -nlp -di0"
alias indent="/usr/bin/indent $1 $2 -bbb -bap -lp -sob -nip -di2"
alias top="htop"

export ENABLE_STARTUP_LOCALE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export ACK_PAGER="less -r"

# homebrew byobu
export BYOBU_PREFIX=$(brew --prefix)

# A righteous umask
umask 22

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" ]]
