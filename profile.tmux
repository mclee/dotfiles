source $BYOBU_PREFIX/share/byobu/profiles/tmux
source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
set -g default-terminal "screen-256color"
set -g status-bg '#666666'
set -g status-fg '#EEEEEE'

set-option -g status on
set-option -g status-utf8 on
#set-option -g status-justify "centre"
#set-option -g status-left-length 60
#set-option -g status-right-length 90
#set-option -g status-left "#(~/tmux-powerline/powerline.sh left)"
#set-option -g status-right "#(~/tmux-powerline/powerline.sh right)"
set-window-option -g alternate-screen off
