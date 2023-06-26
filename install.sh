#!/bin/sh

# install nix
curl -L https://nixos.org/nix/install | sh &
echo "intsalling"

# source nix
. $HOME/.nix-profile/etc/profile.d/nix.sh


if [[ $(git --version) != "git version"* ]] ; then
	nix-env -iA nixpkgs.git
fi

# install packages
nix-env -iA \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.gh \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv

echo "" > ./zsh/.config/zsh/alias/alias.zsh
echo "alias cat='bat'" >> ./zsh/.config/zsh/alias/alias.zsh
echo "alias vim='nvim'" >> ./zsh/.config/zsh/alias/alias.zsh
echo "source '$HOME/.config/zsh/alias/nala.zsh'" >> ./zsh/.config/zsh/alias/alias.zsh

# stow dotfiles
stow fonts
stow git
stow nvim
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER


# install neovim plugins
#nvim --headless +PlugInstall +qall

