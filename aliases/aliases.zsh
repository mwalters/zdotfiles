alias bup="brew update && brew upgrade && brew cleanup"
alias tf='terraform'
alias dns-flush='sudo killall -HUP mDNSResponder'
alias flush-dns='dns-flush'
alias flushdns='dns-flush'
alias flushdns='dns-flush'

alias 1pass='eval $(op signin my)'

alias x='tmux'
alias rg='ranger'

alias logit="echo `date '+ %a %h %d %Y %r'` ' - ' $@"

alias f='open -a Finder ./'

alias abrew='cat ~/.oh-my-zsh/plugins/brew/README.md'

function npm-exec {
   $(npm bin)/$@
}

function ip {
    echo "Ethernet: `ipconfig getifaddr en0 \n`"
    echo "WiFi    : `ifconfig | grep inet | grep broadc | cut -d ' ' -f 2`"
    echo "External: `curl -s http://ipecho.net/plain`"
    # Backup service:
    # echo "External: `curl -s icanhazip.com`"
}

# Show a cheatsheet from https://cht.sh
function cheat() {
  curl "https://cht.sh/$1"
}

# On Mac OS X, copies the contents of a text file to the clipboard
# Found at <http://brettterpstra.com/2013/01/15/clip-text-file-a-handy-dumb-service>
function clip() {
  type=`file "$1"|grep -c text`
  if [ $type -gt 0 ]; then
    cat "$@" | pbcopy
    echo "Contents of $1 are in the clipboard."
  else
    echo "File \"$1\" is not plain text."
  fi
}

# Retrieve dictionary definitions of words.
# Adapted from code found at <http://onethingwell.org/post/25644890287/a-shell-function-to-define-words>
function define() {
  if [[ $# -ge 2 ]]; then
    echo "$0: too many arguments" >&2
    return 1
  else
    curl "dict://dict.org/d:$1"
  fi
}

# Search shell history
function hgrep() {
  history 1 | grep $1
}

# https://github.com/joshdick/dotfiles/blob/main/zsh.symlink/functions.zsh
# Search for files by name
# Case-insensitive and allows partial search
# If on Mac OS X, will prompt to open the file if there is a single result
function search() {
  results=`find . -iname "*$1*"`
  echo $results
  if command_exists open; then
    resultLength=`echo $results | wc -l | sed -e "s/^[ \t]*//"`
    if [ $resultLength -eq 1 ]; then
      while true; do
        echo "One result found! Open it? (y/n)?"
        read yn
        case $yn in
          [Yy]* ) open $results; break;;
          [Nn]* ) break;;
          * ) echo "Please answer (Y/y)es or (N/n)o.";;
        esac
      done
    fi
  fi
}

