# Obtain IP for a hostname
function ipfor() {
    dig +short $1 | grep -E '^[0-9.]+$' | head -1
}
