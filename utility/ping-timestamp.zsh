# Ping with timestamp
function tsping() {
    ping -i 5 $1 | while read pong; do echo "$(date '+%Y-%m-%d %T'): $pong"; done
}
