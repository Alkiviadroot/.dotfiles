#!/bin/env bash

# Install nix
curl -L https://nixos.org/nix/install | sh 

# Source nix
. $HOME/.nix-profile/etc/profile.d/nix.sh

# Intall stow
nix-env -iA nixpkgs.stow

distro()
{
read -rep "$(echo -e '\n>1. Debian \n>2. RHEL \n>3. Arch \n>4.Exit \nInput: ')" DISTRO

if [[ $DISTRO -eq 4 ]] ; then
	exit
elif [[ $DISTRO -ne 1 && $DISTRO -ne 2 && $DISTRO -ne 3 ]] ; then
	echo -e "\nInvalid Input!"
	distro
else
	menu
fi
}

menu () 
{
	read -p "Install [All/Custom/Exit] : " INPUT
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

zshInstall()
{
if [[ $(zsh --version) != "zsh"* ]] ; then
	echo "zsh Installing..."
	case $DISTRO in
	  1)
	    sudo apt install zsh
	    ;;
	  2)
	    sudo dnf install zsh
	    ;;
	  3)
	    sudo pacman -S zsh
	    ;;
	esac
fi

echo "Setting zsh as default shell"
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER
}

all ()
{
zshInstall
}

custom()
{
echo "Shells"
}



distro
