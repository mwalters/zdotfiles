# Remove dangling dangled dangles
alias dkrmdanglei="docker images -q --filter dangling=true | xargs docker rmi"
alias dkrmdanglev="docker volume ls -qf 'dangling=true' | xargs docker volume rm"
alias dkrmdangle="dkrmdanglev && dkrmdanglei"

alias dk="docker"

# Prune containers; remove containers that are stopped
alias dkp="docker container prune -f"

# Get container process
alias dkps="docker ps"

# Get process included stop container
alias dkpa="docker ps -a"

# Get images
alias dki="docker images"

# Stop all containers
dkstop() { docker stop $(docker ps -a -q); }

# Remove all containers
dkrm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias dkrmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dkri() { docker rmi $(docker images -q); }

# Show all alias related docker
dkalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dkbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
