#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias neofetch='fastfetch --config ~/.config/fastfetch/neofetch-small-config.jsonc'

PS1='[\u@\h \W]\$ '

# Miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Starship
eval "$(starship init bash)"
