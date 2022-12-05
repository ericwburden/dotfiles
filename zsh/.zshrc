#   _____      _| |__
#  / _ \ \ /\ / / '_ \	Eric Burden <eric@ericburden.dev>
# |  __/\ V  V /| |_) |	www.ericburden.work
#  \___| \_/\_/ |_.__/	www.github.com/ericwburden
#  
# zsh config file 

########################################################################################
# => Environment Variables
########################################################################################

export ZSH="/home/eric/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.local/bin/scripts"
export VISUAL=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config

########################################################################################
# => Theming
########################################################################################

ZSH_THEME="mrtazz"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

########################################################################################
# => Plugins
########################################################################################

plugins=(git
         rust
         chucknorris
         colored-man-pages
         direnv
         emoji
         gh
         gitignore
         ripgrep
         rust
         zsh-autosuggestions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


########################################################################################
# => Aliases
########################################################################################

alias mkmv='(){ mkdir -p $1; mv $2 $1; }'
alias dchdmi='xrandr --output HDMI-0 --off'
alias hdmi='xrandr --output HDMI-0 --auto --left-of DP-2'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias CD='cd ~/OpenSource/CodingDojo'
alias MCC='cd ~/Projects/midday_coding_challenges'
alias CW='cd ~/Projects/code_wars'
alias ls='exa'
alias ll='exa -l'
alias lsa='exa -a'
alias lla='exa -la'
alias k8='kubectl'
alias weather='curl wttr.in'


########################################################################################
# => Miscellaneous
########################################################################################

# Disable CTRL-S default behavior (freeze the terminal)
stty -ixon

eval "$(direnv hook zsh)"   # Hook direnv into shell
eval "$(starship init zsh)" # Initialize Starship prompt

tmux source ~/.config/tmux/tmux.conf
alias luamake=/luamake
