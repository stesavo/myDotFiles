######################################################################################################
# stesavos oh-my-zsh config                                                                          #
#                                                                                                    #
# DEPENDENCIES                                                                                       #
#  oh-my-zsh                                                                                         #
#  powerlevel9k                                                                                      #
#  font patched for powerline (I use Hack)                                                           #
#                                                                                                    #
# I had to do some editing to make things work the way I wanted. Look out for FIXME in this file     #
#                                                                                                    #
# In case commands get echoed to STANDARD OUTPUT like this:                                          #
# >ls                                                                                                #
# lsfoo.bar                                                                                          #
#                                                                                                    #
# FIXME rename ~/.oh-my-zsh/lib/termsupport.zsh to  ~/.oh-my-zsh/lib/termsupport.zsh.off             #
#                                                                                                    #
######################################################################################################

export TERM=screen-256color

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn common-aliases cpanm dirhistory pip) 

source $ZSH/oh-my-zsh.sh

# svn plugin did not work for me out of the box. My fix:
# in ~/.oh-my-zsh/plugin/svn.zsh function svn_dirty_choose_pwd needs to be edited:
# FIXME remove $PWD param from svn status

# svn
prompt_svn() {
	local rev branch
	if in_svn; then
		rev=$(svn_get_rev_nr)
		branch=$(svn_get_branch_name)
		if [[ $(svn_dirty_choose_pwd 1 0) -eq 1 ]]; then
            local color='%F{black}'
			echo -n "%{$color%}$rev@$branch "
		else
            local color='%F{green}'
			echo -n "%{$color%}$rev@$branch "
		fi
	fi
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#use emacs key bindings (default)
bindkey -e
# always show alternatives after TAB auto-completion
unsetopt listambiguous

export GREP_OPTIONS='--color=auto'
export LC_COLLATE=C

#disable flow control
stty stop '';
stty start '';

# powerlevel9k setup
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="▷ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
POWERLEVEL9K_SVN="prompt_svn"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context virtualenv dir dir_writable root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs svn history background_jobs time)

#dir colors setup
[ -f ~/.dircolors ] && eval `dircolors -b ~/.dircolors`
alias ls='ls --color=auto'

#colored man pages
[ -f ~/bin/termcolorsetup.zsh ] && source ~/bin/termcolorsetup.zsh

#put the personal part of your config in ...
[ -f ~/.personalConfig.zsh ] && source ~/.personalConfig.zsh

