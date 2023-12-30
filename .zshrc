# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

#zstyle :omz:plugins:ssh-agent agent-forwarding on
# Path to your oh-my-zsh installation.
export ZSH="/Users/sk/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="macovsky"
# ZSH_THEME="jnrowe"
ZSH_THEME="lambda"
# ZSH_THEME="muse"
# ZSH_THEME="sunrise"
# ZSH_THEME="pi"
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
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

export NVM_LAZY_LOAD=true

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # zsh-autosuggestions
  # colorize
  fzf
  #zsh-syntax-highlighting
  # themes
  z
  zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# alias ls='ls -Ghf'

# Run on new shell
# if [ `which fortune` ]; then
#     echo ""
#     fortune work | cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows | gshuf -n1)
#     echo ""
# fi

#alias vi=~/.local/bin/nvim-osx64/bin/nvim
alias vi=nvim
#alias emacs=emacs-26.3
# alias g++='g++-11 -std=c++17'
#alias emacs='emacs-26.2 --daemon'
alias du='du -shc *'
alias gist='git st'
alias gits='git st'
alias gitd='git diff'
alias gitds='git diff --staged'
alias gitdf='git difftool'
alias gitdfs='git difftool --staged'
alias gitcm='git checkout master'
export EDITOR=nvim

# RPROMPT="\e[0;30m]❮ %@ %f"
#RPROMPT='%{$fg_bold[magenta]%}: %@ %f'
RPROMPT='%{$fg_bold[red]%}✖ %@%{$reset_color%}%'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt extendedglob
# to remove all files except one rm -- ^(<file-name>)

#alias hask="nix-shell -p \"haskellPackages.ghcWithPackages(pkgs: with pkgs; [ ghcid hoogle hlint ])\" "


# alias lo='cmatrix'


[ -f "/Users/sk/.ghcup/env" ] && source "/Users/sk/.ghcup/env" # ghcup-env

# like normal z when used with arguments but displays an fzf prompt when used without.
# unalias z 2> /dev/null
# z() {
#     [ $# -gt 0 ] && _z "$*" && return
#     cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
# }


adark() {
   # source "/Users/sk/pythonVirtualEnv/bin/activate"
   alacritty-colorscheme apply base16-onedark.yml
   pushd
   cd "/Users/sk/.config/alacritty"
   git add alacritty.yml
   git commit --amend --no-edit
   # deactivate
   popd
   ln -fhs ~/.config/nvim/initDark.vim ~/.config/nvim/init.vim
 }

alight() {
   # source "/Users/sk/pythonVirtualEnv/bin/activate"
   alacritty-colorscheme apply base16-brushtrees-256.yml
   pushd
   cd "/Users/sk/.config/alacritty"
   git add alacritty.yml
   git commit --amend --no-edit
   # deactivate
   popd
   ln -fhs ~/.config/nvim/initLight.vim ~/.config/nvim/init.vim
}
office() {
  pushd
  cd "/Users/sk/.config/alacritty"
  git checkout office
  popd
}
home() {
  pushd
  cd "/Users/sk/.config/alacritty"
  git checkout home
  popd
}

export NPM_TOKEN="7d954c78-32ec-4759-81d3-da00c379a3ce"
# export JFROG_AUTH="c2F1cmF2LmtAbnV0YW5peC5jb206QUtDcDhrcjFFbkszV2JEYWJKSjdTcmJrRFVoV205QWNyVUxVYXhmTE5mTXhOZ1ZqU25jTnM4bXY3MWc2Tmt2SEFCMWRDaFpocQo="
export JFROG_AUTH="ZGVlcGFrbGFsLnRwckBudXRhbml4LmNvbTpBS0NwOGtxV3Q5aHdyNGdSWXkxNGNLVktFdTk2OXRWOEdnV3FrMWNocEZNZU1FVXZUQk1SRW9mOWt2bWt5aWQ2VXp6dEt3VEpV"
export JFROG_EMAIL="deepaklal.tpr@nutanix.com"
export JFROG_CERT_BUNDLE_PATH="/Users/sk/cacert.pem"

export PATH="/usr/local/opt/node@12/bin:$PATH"


source /Applications/FDS/FDS6/bin/FDS6VARS.sh
source /Applications/FDS/FDS6/bin/SMV6VARS.sh

export OMP_NUM_THREADS=4

# unlimit stack for OSX
ulimit -s 65532


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/sk/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/usr/local/opt/mongodb-community@5.0/bin:$PATH"

[[ -s "/Users/sk/.gvm/scripts/gvm" ]] && source "/Users/sk/.gvm/scripts/gvm"
# this has to be last line
# zprof

