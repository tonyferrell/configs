# Load Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Only use neovim
alias vim="nvim"
alias vi="nvim"

# Aliases for LS
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

export EDITOR="nvim"
export VISIUAL="nvim"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
        
base16_default-dark
