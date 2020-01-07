#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

HISTFILE=~/.cache/bash_history
HISTSIZE=1000
SAVEHIST=1000

shopt -s autocd
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.

HISTCONTROL=ignoredups

complete -c man which
complete -cf sudo

# PROMPT
PS1="\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;4m\]>>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias df='df -Th' # Human-readable sizes
alias free='free -h'
alias gitu='git add . && git commit && git push'
alias q='exit'
alias apc='apcaccess status'
alias ls='exa --color=always --group-directories-first' # my preferred listing
alias ll='exa --color=always --group-directories-first --long'
alias la='exa --color=always --group-directories-first --all --long'  # all files and dirs
alias ipdata='curl -s "https://ipinfo.io/"'
# -> Prevents accidentally clobbering files.
alias shell-level='printf "$SHLVL\n"'
