autoload -U colors && colors

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.cache/.zsh_history

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
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Tmux-Sessionizer
bindkey -s ^f "tmux-sessionizer\n"

# Source Plugins
source "$HOME/.config/zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-history-substring-search.zsh"
source "$HOME/.config/zsh/plugins/zsh-interactive-cd.zsh"

# Source Aliases
source "$HOME/.config/zsh/alias/alias.zsh"

# Source ZSH profile
source "$HOME/.config/zsh/.zsh_profile"

# Keybindings for history-substring-search 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Starship Prompt
eval "$(starship init zsh)"

# Intitial command
clear && colorscript -r 2> /dev/null
