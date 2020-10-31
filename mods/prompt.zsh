ssh_info() {
    [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

git_info() {

    ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

    local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
    local BEHIND="%{$fg[cyan]%}⇣NUM%{$reset_color%}"
    local MERGING="%{$fg[magenta]%}Merging%{$reset_color%}"
    local UNTRACKED="%{$fg[red]%}Unstaged%{$reset_color%}"
    local MODIFIED="%{$fg[yellow]%}Modifed%{$reset_color%}"
    local STAGED="%{$fg[green]%}Staged%{$reset_color%}"

    local -a DIVERGENCES
    local -a FLAGS

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        FLAGS+=( "$MERGING" )
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        FLAGS+=( "$UNTRACKED" )
    fi

    if ! git diff --quiet 2> /dev/null; then
        FLAGS+=( "$MODIFIED" )
    fi

    if ! git diff --cached --quiet> /dev/null; then
        FLAGS+=( "$STAGED" )
    fi

    [ -z "$FLAGS" ] && FLAGS="$FLAGS "
    [ -z "$DIVERGENCES" ] && DIVERGENCES="$DIVERGENCES "

    echo "$FLAGS$DIVERGENCES"
}

PROMPT=$'$(ssh_info) %B%(?.%F{green}✓.%F{red}X %?)%f%b %B%F{215}%~%f%b%f %B%#%b '

SHOW_AWS_PROMPT=true

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f %m%u%c'
precmd() {
    vcs_info
}
setopt prompt_subst
RPROMPT='$(aws_prompt_info) $(git_info) ${vcs_info_msg_0_}%*'

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$ZSH_COMMAND_TIME seconds"
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$min minutes $sec seconds"
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$hours hours $min minutes $sec seconds"
            else
                timer_show="$min minutes $sec seconds"
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
