#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set -o vi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clearall='printf "\e[H\e[3J"; clear' # clear screen and scrollback buffer
alias neofetch='fastfetch --config ~/.config/fastfetch/neofetch-config.jsonc'
alias uwufetch='fastfetch --config ~/.config/fastfetch/uwufetch-config.jsonc'

alias mpv-mono-track='mpv --lavfi-complex='[aid1][aid2]amix[ao]' $1'

PS1='[\u@\h \W]\$ '

# Miniconda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Starship
eval "$(starship init bash)"
