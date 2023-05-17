# Intitial command
pfetch

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="nvim"

autoload -U colors && colors

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)	


# Use vim keybindings
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Source Plugins
source "$HOME/.config/zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-history-substring-search.zsh"
source "$HOME/.config/zsh/plugins/zsh-interactive-cd.zsh"

# Source Aliases
source "$HOME/.config/zsh/alias/alias.zsh"
source "$HOME/.dotfiles/scripts/alias.zsh"

# Keybindings for history-substring-search 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Source Nix
if [ -e /home/stelios/.nix-profile/etc/profile.d/nix.sh ]; then 
  . /home/stelios/.nix-profile/etc/profile.d/nix.sh; fi


# Spaceship Prompt
source "$HOME/.config/zsh/spaceship/spaceship.zsh"
