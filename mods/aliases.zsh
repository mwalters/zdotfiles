# Make some commands safer
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

alias ls="ls --color=auto"
alias l='ls -l -G'
alias ll='ls -lAh -G'
alias lw='ls -A -G'
alias ld='ls -l -G | grep "^d"'
alias ldot='ls -ld .*'
alias grep='grep --color=auto'
