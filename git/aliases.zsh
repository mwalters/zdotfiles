git config --global core.editor "atom --wait"
export EDITOR="atom --wait"

# Git aliases
alias gs='git status -sb'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gl="git log --graph --oneline --decorate"
alias gbl='git branch -v'
alias gco='git checkout'
alias gd='git diff'
alias gunstage='git reset HEAD'
alias gf='git fetch -t -v -p --progress --all'
alias gfetch='gf'

alias goutgoing='git log origin/master..HEAD --oneline'

alias gunpushed='branch=$(git rev-parse --abbrev-ref HEAD) && git diff origin/$branch..HEAD'

# Branching
alias gbranch-name='git rev-parse --abbrev-ref HEAD'
alias gpublish='git push -u origin $(gbranch-name)'
alias gunpublish='git push origin :$(gbranch-name)'
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"

# Mark a file as "assume unchanged", which means that Git will treat it
# as though there are no changes to it even if there are. Useful for
# temporary changes to tracked files
alias gassume='git update-index --assume-unchanged'
# Reverse the above
alias gunassume='git update-index --no-assume-unchanged'
# Show the files that are currently assume-unchanged
alias gassumed='git ls-files -v | grep ^h | cut -c 3-'
