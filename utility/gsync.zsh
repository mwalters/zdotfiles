# Ping with timestamp
function gsync() {
    branch="$(git rev-parse --abbrev-ref HEAD | tr -d '\n' | xsel -ib)"
    git pull -v --stat --progress origin $branch && git push -v --progress origin $branch
}
