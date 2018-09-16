alias bup="brew update && brew upgrade && brew cleanup"
alias tf='terraform'
alias dns-flush='sudo killall -HUP mDNSResponder'

function npm-exec {
   $(npm bin)/$@
}
