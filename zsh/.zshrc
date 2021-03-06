#   _____      _| |__
#  / _ \ \ /\ / / '_ \	Eric Burden <eric@ericburden.dev>
# |  __/\ V  V /| |_) |	www.ericburden.work
#  \___| \_/\_/ |_.__/	www.github.com/ericwburden
#  
# zsh config file 

########################################################################################
# => Environment Variables
########################################################################################

export ZSH="/home/ericb/.oh-my-zsh"
export PATH="$PATH:~/.local/bin:~/.npm-global/bin:~/.local/share/gem/ruby/3.0.0/bin"
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
         zsh-syntax-highlighting
         zsh-dircolors-solarized)

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


########################################################################################
# => Miscellaneous
########################################################################################

# Disable CTRL-S default behavior (freeze the terminal)
stty -ixon

eval "$(direnv hook zsh)"   # Hook direnv into shell
eval "$(starship init zsh)" # Initialize Starship prompt

source /home/ericb/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/ericb/.cache/paru/clone/scratchjr-desktop-git/src/ScratchJr-Desktop/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/ericb/.cache/paru/clone/scratchjr-desktop-git/src/ScratchJr-Desktop/node_modules/tabtab/.completions/electron-forge.zsh
