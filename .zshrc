#devkit-env
source /etc/profile.d/devkit-env.sh

# Starship
eval "$(starship init zsh)"

# Colours
eval "$(dircolors -b)"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clr='clear'
alias cd='z'
alias py='python'
alias s='yay --color=always -Ss'
alias test='mgba-qt build/gbalatro.gba'
alias ls='eza --icons --group-directories-first'
alias la='eza --icons --group-directories-first -a'        # show hidden
alias ll='eza --icons --group-directories-first -la'       # long format + hidden
alias lt='eza --tree --icons --group-directories-first -L 2'
alias lt3='eza --tree --icons --group-directories-first -L 3'

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

# Path
#
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/var/lib/snapd/snap/bin
export PATH=$HOME/.npm-global/bin:$PATH
