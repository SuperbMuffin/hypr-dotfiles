#devkit-env
source /etc/profile.d/devkit-env.sh

# Starship
eval "$(starship init zsh)"

# Colours
eval "$(dircolors -b)"

# Aliases
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

alias gut='git' # the typo I keep making 

alias sudo='doas'

alias myip='curl -s https://ipinfo.io/json | python3 -c '"'"'import sys,json; d=json.load(sys.stdin); print("IP:", d.get("ip","N/A")); print("City:", d.get("city","N/A")); print("Region:", d.get("region","N/A")); print("Country:", d.get("country","N/A")); print("ISP:", d.get("org","N/A"))'"'"''

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
