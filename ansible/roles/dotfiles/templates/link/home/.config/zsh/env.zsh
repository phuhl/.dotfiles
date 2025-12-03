export EDITOR='eq'

# Fix dolphine application menu issue
# https://bbs.archlinux.org/viewtopic.php?id=295236
export XDG_MENU_PREFIX=plasma-

export XDG_DATA_DIRS="/home/philipp/.local/usr/share/:$XDG_DATA_DIRS"

# Docker rootless socket
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
