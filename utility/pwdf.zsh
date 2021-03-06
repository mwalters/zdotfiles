# prints the path of the front Finder window. Desktop if no window open

# use an alias to change to the current finder window
# alias cdf='pwdf; cd "$(pwdf)"'
function pwdf() {
    finder_path=$( osascript <<- EndOfScript
        tell application "Finder"
            if (count of Finder windows) is 0 then
                set dir to (desktop as alias)
            else
                set dir to ((target of Finder window 1) as alias)
            end if
            return POSIX path of dir
        end tell
EndOfScript
)
    if [[ $1 != "-notilde" ]]; then
        # this correctly inserts '~'
        print -rD $finder_path
    else
        print $finder_path
    fi
}

alias cpwdf='pwdf | pbcopy'
alias cdf='pwdf; cd $(pwdf -notilde )'
