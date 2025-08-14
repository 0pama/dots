#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Switch to system Docker
use-system() {
    systemctl --user stop docker-desktop
    sudo systemctl start docker
    unset DOCKER_HOST
    echo "Using system Docker (/var/run/docker.sock)"
}

# Switch to Desktop
use-desktop() {
    sudo systemctl stop docker
    systemctl --user start docker-desktop
    export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock
    echo "Using Docker Desktop (~/.docker/desktop/docker.sock)"
}
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/go/bin

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
