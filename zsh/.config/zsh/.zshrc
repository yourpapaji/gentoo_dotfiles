## Options section
setopt correct           # Auto correct mistakes
setopt extendedglob      # Extended globbing. Allows using regular expressions with *
setopt nocaseglob        # Case insensitive globbing
setopt rcexpandparam     # Array expension with parameters
setopt nocheckjobs       # Don't warn about running processes when exiting
setopt numericglobsort   # Sort filenames numerically when it makes sense
setopt appendhistory     # Immediately append history instead of overwriting
setopt histignorealldups # If a new command is a duplicate, remove the older one
setopt autocd            # if only directory path is entered, cd there.

# environment
export LANG=en_US.UTF-8
HISTFILE=~/.cache/zsh_history
HISTSIZE=3000
SAVEHIST=3000

## Keybindings section
bindkey '^[Oc' forward-word         #
bindkey '^[Od' backward-word        #
bindkey '^[[1;5D' backward-word     #
bindkey '^[[1;5C' forward-word      #
bindkey '^H' backward-kill-word     # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                 # Shift+tab undo last action
WORDCHARS=${WORDCHARS//\/[&.;]}

# Completions
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true  # automatically find new executables in path
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache
zstyle ':completion:*' squeeze-slashes true
autoload -U compinit colors zcalc
compinit

# Prompt
PROMPT='%(?.%F{blue}√.%F{red}?%?)%f %B%F{green}%1~%f%b %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Plugins
source $ZDOTDIR/plugins/colorize/colorize.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,underline"
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
plugin_update() {
	find $ZDOTDIR/plugins -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull
}

# alias
alias q="exit"
alias df='df -Th'
alias free='free -h'
alias gitu='git add . && git commit && git push'
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -al --color=always --group-directories-first'
