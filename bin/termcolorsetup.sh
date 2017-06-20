#!/bin/bash
# foreground
TPUT_FG_BLACK=`tput setaf 0`
TPUT_FG_BLUE=`tput setaf 1`
TPUT_FG_GREEN=`tput setaf 2`
TPUT_FG_CYAN=`tput setaf 3`
TPUT_FG_RED=`tput setaf 4`
TPUT_FG_MAGENTA=`tput setaf 5`
TPUT_FG_YELLOW=`tput setaf 6`
TPUT_FG_WHITE=`tput setaf 7`

# background
TPUT_BG_BLACK=`tput setab 0`
TPUT_BG_BLUE=`tput setab 1`
TPUT_BG_GREEN=`tput setab 2`
TPUT_BG_CYAN=`tput setab 3`
TPUT_BG_RED=`tput setab 4`
TPUT_BG_MAGENTA=`tput setab 5`
TPUT_BG_YELLOW=`tput setab 6`
TPUT_BG_WHITE=`tput setab 7`

# special
TPUT_BOLD=`tput bold`
TPUT_BLINK=`tput blink`
TPUT_INVERSE=`tput rev`
TPUT_UNDERLINE=`tput smul`
TPUT_RESET=`tput sgr0`

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$"$TPUT_BLINK"                 # begin blinking
export LESS_TERMCAP_md=$"$TPUT_BOLD$TPUT_FG_RED"      # begin bold
export LESS_TERMCAP_me=$"$TPUT_RESET"                 # end mode
export LESS_TERMCAP_se=$"$TPUT_RESET"                 # end standout-mode
export LESS_TERMCAP_so=$"$TPUT_BG_CYAN$TPUT_FG_BLACK" # begin standout-mode - info box/search result
export LESS_TERMCAP_ue=$"$TPUT_RESET"                 # end underline
export LESS_TERMCAP_us=$"$TPUT_UNDERLINE$TPUT_RED"    # begin underline
