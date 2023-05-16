#!/bin/sh

# Install nix
#curl -L https://nixos.org/nix/install | sh 

# Source nix
#. $HOME/.nix-profile/etc/profile.d/nix.sh

# Intall stow
nix-env -iA nixpkgs.stow

menu () 
{
	read -p "Install[All/Custom/Exit]: " INPUT
	INPUT=$( echo "$INPUT" | tr -s '[:upper:]' '[:lower:]' )

	case $INPUT in

	  a | all)
	    all
	    ;;

	  c | custom)
	    custom
	    ;;

	  e | exit)
	    exit
	    ;;

	  *)
	    printf "\nWrong Input! Try again... \n"
	    menu
	    ;;
	esac
}
zsh()
{
nix-env -iA nixpkgs.zsh
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER
}


all ()
{
}

custom()
{
}



menu
