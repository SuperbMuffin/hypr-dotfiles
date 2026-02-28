
# Starship
eval "$(starship init zsh)"

# Colours
eval "$(dircolors -b)"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clr='clear'
alias cd='z'

# Auto Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# Spicetify
PATH=$PATH:~/.spicetify

# Syntax Highlighting
source ~/.config/zsh/syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide
eval "$(zoxide init zsh)"
