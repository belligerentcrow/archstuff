#
# ~/.bashrc
#
# using this to sync the theme with wal
. "${HOME}/.cache/wal/colors.sh"
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
