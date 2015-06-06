# Path to your oh-my-zsh installation.
export ZSH=/home/jkl/.oh-my-zsh
export UPDATE_ZSH_DAYS=30

#ZSH_THEME="agnoster"
ZSH_THEME="jkl"

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
 ZSH_CUSTOM=/home/jkl/.omz-customizations

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

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
alias xup="sh ~/.dotfiles/xup.sh" #FIXME

# if we have local zsh changes add here
if [ -x ~/.zlocal ]; then
  source ~/.zlocal
fi

gu() {ip link show | grep -q "state UP" &&  git pull -q && git submodule -q foreach --recursive git pull -q}



