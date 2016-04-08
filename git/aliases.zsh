git config --global core.editor "subl -n -w"
export EDITOR="subl -w"

# Git aliases
alias gs='git status -sb'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%cn]%Creset' --abbrev-commit --date=relative | more"
alias gbl='git branch -v'
alias gco='git checkout'
alias gd='git diff'
alias gunstage='git reset HEAD'

alias gwtf='$HOME/.dotfiles/git/git-wtf'

# Branching
alias gbranch-name='git rev-parse --abbrev-ref HEAD'
alias gpublish='git push -u origin $(git gbranch-name)'
alias gunpublish='git push origin :$(git gbranch-name)'

# Next one requires `xsel` to be installed
alias gbcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | xsel -ib"

# Mark a file as "assume unchanged", which means that Git will treat it
# as though there are no changes to it even if there are. Useful for
# temporary changes to tracked files
alias gassume='git update-index --assume-unchanged'
# Reverse the above
alias gunassume='git update-index --no-assume-unchanged'
# Show the files that are currently assume-unchanged
alias gassumed='git ls-files -v | grep ^h | cut -c 3-'
