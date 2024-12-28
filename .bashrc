# .bashrc

# set vi mappings
set -o vi

#use vim (neovim) as default editor
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Glacier inspired colors (https://github.com/NSBrianWard/Glacier-Remixes)
export LS_COLORS='di=94:ln=32:so=91:pi=91:ex=95:bd=36:cd=36:su=31:sg=31:tw=33:ow=33:*.xbps=93'

# Alias
alias ls='ls --color=auto'

# Colored prompt
PS1='\[\033[33m\]\u@\h\[\033[0m\]:\[\033[94m\]\w\[\033[0m\]\[\033[36m\]$\[\033[0m\] '

