alias bup="brew update && brew upgrade && brew cleanup"
alias tf='terraform'
alias dns-flush='sudo killall -HUP mDNSResponder'

alias 1pass='eval $(op signin my)'

alias x='tmux'
alias rg='ranger'

alias logit="echo `date '+ %a %h %d %Y %r'` ' - ' $@"

function npm-exec {
   $(npm bin)/$@
}

function ip {
    echo "Ethernet: `ipconfig getifaddr en0 \n`"
    echo "External: `curl -s http://ipecho.net/plain`"
  echo "WiFi    : `ifconfig | grep inet | grep broadc | cut -d ' ' -f 2`"
}
