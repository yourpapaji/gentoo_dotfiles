HISTFILE=~/.cache/zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Options section
setopt correct           # Auto correct mistakes
setopt extendedglob      # Extended globbing. Allows using regular expressions with *
setopt nocaseglob        # Case insensitive globbing
setopt rcexpandparam     # Array expension with parameters
setopt nocheckjobs       # Don't warn about running processes when exiting
setopt numericglobsort   # Sort filenames numerically when it makes sense
setopt appendhistory     # Immediately append history instead of overwriting
setopt histignorealldups # If a new command is a duplicate, remove the older one
setopt autocd            # if only directory path is entered, cd there.

# Keybindings section
bindkey -e
bindkey '^[Oc' forward-word         #
bindkey '^[Od' backward-word        #
bindkey '^[[1;5D' backward-word     #
bindkey '^[[1;5C' forward-word      #
bindkey '^H' backward-kill-word     # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                 # Shift+tab undo last action
WORDCHARS='~!#$%^&*(){}[]<>?+;-'
MOTION_WORDCHARS='~!#$%^&*(){}[]<>?+;-/'

# aliases
alias q='exit'
alias df='df -Th'
alias free='free -h'
alias gitu='git add . && git commit && git push'
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -al --color=always --group-directories-first --git'
alias zshrc='nvim $ZDOTDIR/.zshrc'
alias vimrc='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias portail='sudo tail -f /var/log/emerge-fetch.log'

# Completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true  # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache
zstyle ':completion:*' squeeze-slashes true
autoload -U compinit
compinit -d

# Prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Plugins
source $ZDOTDIR/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374"
## histdb integration with autosuggestions
_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}
ZSH_AUTOSUGGEST_STRATEGY=histdb_top
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source $ZDOTDIR/plugins/zsh-sudo/sudo.plugin.zsh
plugin_update() {
	find $ZDOTDIR/plugins -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull
}

# prompt cursor fix when exiting vim
local cursor="\x1b[\x33 q"
if [ "$TYPEWRITTEN_CURSOR" = "block" ]; then
  cursor="\e[1 q"
elif [ "$TYPEWRITTEN_CURSOR" = "beam" ]; then
  cursor="\e[5 q"
fi
_fix_cursor() {
  echo -ne "${cursor}"
}
precmd_functions+=(_fix_cursor)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
