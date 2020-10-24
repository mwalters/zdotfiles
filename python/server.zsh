# Start an HTTP server from a directory, optionally specifying the port; defaults to 8080
function server() {
    local port="${1:-8080}"
    python3 -m http.server $port
}
