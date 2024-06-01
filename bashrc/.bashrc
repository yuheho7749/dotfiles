#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias neofetch='fastfetch --config neofetch.jsonc'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
