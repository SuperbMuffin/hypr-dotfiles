
#Starship
eval "$(starship init zsh)"
eval "$(dircolors -b)"

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clr='clear'

#Auto Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

PATH=$PATH:~/.spicetify
