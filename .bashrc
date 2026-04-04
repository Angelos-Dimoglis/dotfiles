#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

### ENV VARIABLES ###

export BROWSER=brave
export EDITOR=nvim
export TERMINAL=alacritty
export PAGER=less
export LESSHISTFILE=-
export MANPAGER="nvim +Man\!"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

## CONFIG ##
# FIX: ~/.npm/_logs/ was generated, I haven't found how to redirect it
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GIT_CONFIG="$XDG_CONFIG_HOME/git/config"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
#export KUBECONFIG="$XDG_CONFIG_HOME/kube"
# TODO: add kubernetes and ansible

## CACHE ##
# FIX: ~/.nv was regenerated
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
#export KUBECACHEDIR="$XDG_CACHE_HOME/kube"

## DATA ##
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"

## STATE ##
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"

## RUNTIME ##
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

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

add_to_path "$XDG_DATA_HOME/cargo/bin"
add_to_path "$HOME/Downloads/idea-IU-252.25557.131/bin"
add_to_path "$HOME/.dotfiles/bin/"
add_to_path "$HOME/Desktop/programming/bash/"

export PATH

# NOTE: there is this syntax that checks for an empty $PATH
# ${PATH:+:${PATH}}

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

### VI MODE ###

# change default (CUA) binds to vim binds but keep ctrl-l
set -o vi
bind -m vi-command "Control-l: clear-screen"
bind -m vi-insert "Control-l: clear-screen"

### COMPLETION ###

# FIX: this was kept from the original default bashrc but completion
# doesn't work.
#
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

### TEMP PROMPT ###

PS1="temp_prompt > "

### SOURCING FILES ###

BASH_CONFIG_FILES="$HOME/.config/bash/"
for file in \
    "${BASH_CONFIG_FILES}bash_prompt" \
    "${BASH_CONFIG_FILES}bash_aliases" \
    "${BASH_CONFIG_FILES}bash_functions"
do
    [ -f "$file" ] && . "$file"
done
