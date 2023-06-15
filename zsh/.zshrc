autoload -Uz compinit
compinit

# source pieced config
[ -f $HOME/.config/zsh/aliasrc ] && source $HOME/.config/zsh/aliasrc
[ -f $HOME/.config/zsh/shortcut ] && source $HOME/.config/zsh/shortcut
[ -f  /home/so/.local/git-prompt.sh ] && source /home/so/.local/git-prompt.sh 
[ -f /home/so/.local/zsh-z.plugin.zsh ] && source /home/so/.local/zsh-z.plugin.zsh
export ZSHZ_CASE=smart

fpath=(
    ~/.config/zsh/autoload
    ~/.zsh $fpath)
autoload -Uz ~/.config/zsh/autoload/*(.:t)


# History
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_DUPS

#   Appearance
# Prompt
# git branch
setopt PROMPT_SUBST  

# vim running
checkVimstatus=$(echo $VIMRUNTIME)
[ -z $checkVimstatus ] && shellEmulator="" || shellEmulator="%F{magenta}:vim%f"

precmd () {
__git_ps1 "%B%F{red}[%f%n@%m${shellEmulator} %F{cyan}%3~%f%F{red}]%f%b" "
%B»%b " "|%s"
}
PS2='%F{green}%_>%f '

#   Vim mode
set -o vi
KEYTIMEOUT=1

# cursor
_reset_cursor_color() printf '\e]112\a'

zle-keymap-select() {
  if [[ -z $TMUX ]]; then
    [[ $KEYMAP = vicmd ]] && printf '\e]12;#00ffff\a' || _reset_cursor_color
  else 
    [[ $KEYMAP = vicmd ]] && printf '\e]12;Cyan\a' || _reset_cursor_color
  fi
}
zle -N zle-keymap-select

zle-line-init() zle -K viins
zle -N zle-line-init

precmd_functions+=(_reset_cursor_color)

# edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#   Completion
# Hugo completion
alias hcom="source <(hugo completion zsh); compdef _hugo hugo"
# Build and Update site
bs(){
    cd ~/git_repo/mine/blog
    if [ -z "$*" ]; then
        msg="rebuild site at $(date +%d.%m.%y-%H:%M:%S)"
    else
        msg="$*"
    fi
    git add --all
    git commit -m "$msg"
    git push
}

# smart case
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[[Z' reverse-menu-complete
