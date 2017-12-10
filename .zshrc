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

source <(antibody init)
antibody bundle robbyrussell/oh-my-zsh/ folder:plugins/svn
antibody bundle zdharma/fast-syntax-highlighting
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
# powerlevel9k setup
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▷ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
POWERLEVEL9K_SVN="prompt_svn"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context virtualenv dir dir_writable root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs svn history background_jobs time)
