# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.omz-customizations

export UPDATE_ZSH_DAYS=30

# if we're using the koding web terminal don't use a theme that 
# requires unicode support 
if env | grep -q koding; then
  ZSH_THEME="gnzh"
else
  ZSH_THEME="jkl"
fi

CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"

# unless we're on sdf then add sdf-stuff
if env | grep -q arpa; then
 export PATH='$PATH:/usr/pkg/bin:/usr/local/bin:/usr/bin:/bin:/usr/pkg/games:/usr/pkg/X11R7/bin'
fi

# export MANPATH="/usr/local/man:$MANPATH"
# additional pathing (this might break stuff)
export PATH="$PATH:$HOME/bin"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# For a full list of active aliases, run `alias`.


if [ `id -un` != root ]
 then
  # start up keychain to handle ssh-agent
   /usr/bin/keychain ~/.ssh/id_ecdsa ~/.ssh/id_rsa
  # Source the ssh-agent ENV variables
   source ~/.keychain/`hostname`-sh
fi

if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# some aliases
alias statmk="make SHARED=0 CC='gcc -static'"
alias xup="sh ~/.sbin/xup.sh" #FIXME
#alias su='/bin/su root -c "/bin/bash --rcfile ${HOME}/.bash_profile"'
#
# if we have local zsh changes add here
if [ -x ~/.zlocal ]; then source ~/.zlocal; fi

# if rvm is installed make sure we use it
if [ -x ~/.rvm/scripts/rvm ]; then 
  source ~/.rvm/scripts/rvm;
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 fi

gu() {ip link show | grep -q "state UP" &&  git pull -q && git submodule -q foreach --recursive git pull -q} #TODO: make this better

# alias to keep one-line headers but do things with the rest 

khead() {
  IFS= read -r header
  printf '%s\n' "$header"
  "$@"
}

# some more aliases
alias lish-tx="ssh -t lish-dallas.linode.com"
alias as='azure network dns'
