#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/jungle/blockChain_Upgrad/assignment2/fabric-samples/bin:$PATH

#zstyle :omz:plugins:ssh-agent agent-forwarding on
# Path to your oh-my-zsh installation.
export ZSH="/Users/sauravk/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME="sunrise"
ZSH_THEME="pi"
# ZSH_THEME=random
# ZSH_THEME="gallois"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "pi" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

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

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
#  zsh-autosuggestions
  colorize
  fzf
  zsh-syntax-highlighting
  themes
  z
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias ls='ls -Ghf'

# Run on new shell
# if [ `which fortune` ]; then
#     echo ""
#     fortune work | cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows | gshuf -n1)
#     echo ""
# fi

alias vi=nvim
#alias emacs=emacs-26.3
alias g++='g++ -std=c++17'
#alias emacs='emacs-26.2 --daemon'
alias du='du -shc *'
export EDITOR=nvim

export P4CONFIG=.p4config
export P4EDITOR=nvim
export P4DIFF='vimdiff -d'

[ -f ~/.fzf/fzf.zsh ] && source ~/.fzf/fzf.zsh
# RPROMPT="\e[0;30m]❮ %@ %f"
#RPROMPT='%{$fg_bold[magenta]%}: %@ %f'
RPROMPT='%{$fg_bold[red]%}✖ %@%{$reset_color%}%'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt extendedglob
# to remove all files except one rm -- ^(<file-name>)

#task

alias me='cd ~/jungle'
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+48); do
  compinit
done
compinit -C
#zprof

#alias hask="nix-shell -p \"haskellPackages.ghcWithPackages(pkgs: with pkgs; [ ghcid hoogle hlint ])\" "

# if [ -f ~/.config/exercism/exercism_completion.bash ]; then
#   source ~/.config/exercism/exercism_completion.bash
# fi
export PATH=/Users/sauravk/vmware/debug-tools:/Users/sauravk/vmware/debug-tools/modules:$PATH
if [ /Users/sauravk/.local/bin/kubectl ]; then source <(kubectl completion zsh); fi

alias md5sum='md5 -r'
alias lo='cmatrix'


# wcp vars for go lang
export GOPATH=$HOME/wcp
export PATH=$PATH:$GOPATH/bin
# PATH="/usr/local/opt/go@1.12/bin:$PATH"
PATH="/usr/local/opt/gettext/bin:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
