#
# ENVIRONMENT
#

umask 022

export EDITOR='nano'
export VISUAL='nano'

export HISTFILE=$HOME/.history
export HISTSIZE=1024
export SAVEHIST=1024

export GREP_OPTIONS='--color=auto'
export GREP_COLORS='mt=7'

export PAGER='less'
export LESS='-g -i -M -R -S -w -X -z-4'
export LESSHISTFILE=-
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

typeset -gU cdpath fpath mailpath path

path=(
    $HOME/bin(N)
    /opt/homebrew/{,s}bin(N)
    $path
)

. "$HOME/.asdf/asdf.sh"

fpath=(${ASDF_DIR}/completions $fpath)

#
# ALIASES
#

alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -d .*'
alias ll='ls -hl'
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
alias rf='rm -rf'
alias df='df -kh'
alias du='du -kh'
alias mkdir='mkdir -p'
alias ping='ping -c 4'
alias pong='ping 8.8.8.8'
alias uptime='uptime --pretty'

alias -g C='| column -t'
alias -g G='| grep'
alias -g L='| less'
alias -g N='| wc -l'

#
# OPTIONS
#

setopt AUTO_CD
setopt EXTENDED_GLOB
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_PARAM_SLASH
setopt LIST_PACKED
setopt LONG_LIST_JOBS
setopt AUTO_RESUME
setopt NOTIFY
setopt CHASE_LINKS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP

unsetopt BG_NICE
unsetopt HUP
unsetopt CHECK_JOBS

#
# COMPLETIONS
#

autoload -Uz compinit && compinit

zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:descriptions' format '%B%d:%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

#
# KEY BINDINGS
#

bindkey -e

bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[A'  up-line-or-history
bindkey '^[[B'  down-line-or-history
bindkey '^[[C'  forward-char
bindkey '^[[D'  backward-char
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[5~' history-search-backward
bindkey '^[[6~' history-search-forward
bindkey '^[[Z'  reverse-menu-complete
bindkey '^?'    backward-delete-char

#
# PROMPT
#

PROMPT='%F{magenta}%B> %F{blue}%~%b%f %# '
