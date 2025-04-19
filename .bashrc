#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|

# TODO: add case insensetive tab completion for commands

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

### PATH ###

add_to_path () {
    # if given path doesn't exist, warn and return
    if [ ! -d "$1" ]; then
        echo "Warning: $1 doesn't exist (check .bashrc)"
        return
    fi

    # add it to the path if it doesn't exist already
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}

add_to_path "$HOME/.cargo/bin"

# NOTE: there is this syntax that checks for an empty $PATH
# ${PATH:+:${PATH}}

### ENV VARIABLES ###

export PATH
export BROWSER=brave
export EDITOR=nvim
export TERMINAL=alacritty
export PAGER=less
export LESSHISTFILE=-
export MANPAGER="nvim +Man\!"
export BASH_CONFIG_FILES="$HOME/.config/bash/"

### HISTORY ###

HISTSIZE=1000          # max number of commands in memory
HISTFILESIZE=2000      # max number of commands in the history file
HISTCONTROL=ignoreboth # no duplicates, no spaces

# dont write the listed commands in history
HISTIGNORE="ls*:cd:clear*:exit:history*:qssh*"

### SHOPT ###

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s checkwinsize # check terminal size
shopt -s autocd       # <path> -> cd -- <path>

### LESS ###

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### VI MODE ###

# change default (emacs) binds to vim binds
# but keep ctrl-l
set -o vi
bind -m vi-command "Control-l: clear-screen"
bind -m vi-insert "Control-l: clear-screen"


### DONT KNOW ###

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1" ;;
	*) ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

###############

### SOURCING FILES ###

for file in \
    "${BASH_CONFIG_FILES}bash_prompt" \
    "${BASH_CONFIG_FILES}bash_aliases" \
    "${BASH_CONFIG_FILES}bash_functions"
do
    [ -f "$file" ] && . "$file"
done
