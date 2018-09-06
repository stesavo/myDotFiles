#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if ! [[ -f '/usr/local/bin/antibody' ]]
then
    curl -sL https://git.io/antibody | bash -s
fi

################################################################################################################

# always show alternatives after TAB auto-completion
unsetopt listambiguous
setopt extended_glob
export LC_COLLATE=C
#disable flow control
stty stop '';
stty start '';

################################################################################################################

#dir colors setup
[ -f ~/.dircolors ] && eval `dircolors -b ~/.dircolors`
alias ls='ls --color=auto'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

################################################################################################################

#colored man pages
[ -f ~/bin/termcolorsetup.zsh ] && source ~/bin/termcolorsetup.zsh

################################################################################################################

#put the personal part of your config in ...
[ -f ~/.personalConfig.zsh ] && source ~/.personalConfig.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################################################

# powerlevel9k setup
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▷ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context virtualenv dir dir_writable root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history background_jobs load time)

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim
