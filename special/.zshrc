# zmodload zsh/zprof
# Oh-my-zsh installation path
#
# ZSH=/usr/share/oh-my-zsh/

# Powerlevel10k theme path
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
# plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )

# In case a command is not found, try to find the package that has it
# function command_not_found_handler {
#     local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
#     printf 'zsh: command not found: %s\n' "$1"
#     local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
#     if (( ${#entries[@]} )) ; then
#         printf "${bright}$1${reset} may be found in the following packages:\n"
#         local pkg
#         for entry in "${entries[@]}" ; do
#             local fields=( ${(0)entry} )
#             if [[ "$pkg" != "${fields[2]}" ]]; then
#                 printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
#             fi
#             printf '    /%s\n' "${fields[4]}"
#             pkg="${fields[2]}"
#         done
#     fi
#     return 127
# }
#
# # Detect AUR wrapper
# if pacman -Qi yay &>/dev/null; then
   # aurhelper="yay"
# elif pacman -Qi paru &>/dev/null; then
   # aurhelper="paru"
# fi

# function in {
    # local -a inPkg=("$@")
    # local -a arch=()
    # local -a aur=()

    # for pkg in "${inPkg[@]}"; do
        # if pacman -Si "${pkg}" &>/dev/null; then
            # arch+=("${pkg}")
        # else
            # aur+=("${pkg}")
        # fi
    # done

    # if [[ ${#arch[@]} -gt 0 ]]; then
        # sudo pacman -S "${arch[@]}"
    # fi

    # if [[ ${#aur[@]} -gt 0 ]]; then
        # ${aurhelper} -S "${aur[@]}"
    # fi
# }

# Helpful aliases
alias c='clear' # clear terminal
alias btskillissue='pavucontrol'
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

# Directory navigation shortcuts
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

#Docker aliases
alias fDMIp="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'" # find a running container iP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#nvim
nvim() {
    if [ -d "$1" ]; then
        cd "$1" && command nvim
    else
        command nvim "$@"
    fi
}

#random one
alias countdown='termdown'

# vim stuff
set -o vi

export EDITOR=nvim

tmux-sessionizer-widget() {
  # Exit vi command mode first if we're in it
  if [[ $KEYMAP == "vicmd" ]]; then
    zle vi-insert
  fi
  LBUFFER="tmux-sessionizer"
  zle accept-line
}

zle -N tmux-sessionizer-widget



# tmux stuff 
quick-tmux() {
    local default_session=""
    echo -n "Enter session name [$default_session]: "
    read session_name
    session_name="${session_name:-$default_session}"
    
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Attaching to existing session: $session_name"
        tmux attach -t "$session_name"
    else
        echo "Creating new session: $session_name in $HOME"
        tmux new-session -s "$session_name" -c "${0:a:h}"
    fi
}

bindkey -M viins '^f' tmux-sessionizer-widget
bindkey -M vicmd '^f' tmux-sessionizer-widget

# bindkey -s '\et' "tmux-sessionizer -s 1\n"
# bindkey -s '\en' "tmux-sessionizer -s 2\n"
# bindkey -s '\es' "tmux-sessionizer -s 3\n"

bindkey  -s '^N' "nvim \n"

# Bind to Ctrl+T
bindkey -s '^t' "quick-tmux\n"

#
bindkey -s '^e' "yazi\n"

# future me this is best idea i have ever had 
# future me here you never used this i dont why you even have it here and ffs why ctrl x and then ctrl e you emacs fuck
# future  future me here thank you past past me the previous future me is stupid  i used this for a long command that i was too lazy to put into a file but still needed to edit and i got help from the lsp as well 
# future future future me here fuck all past me corny fucks talking to themselves
# future future future  future previous future me look who is talking  you out here talking to your self past past (the one that added this shit thank you  i used it again)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

#pokemon-colorscripts --no-title -r 1,3,6

export PATH=$PATH:/home/opama/.spicetify
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:$HOME/go/bin:$HOME/.config/herd-lite/bin

export PATH=$PATH:/home/opama/.config/emacs/bin
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$HOME/.local/opt/go/bin:$HOME/.local/bin:$PATH
# zprof
