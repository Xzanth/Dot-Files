#!/usr/bin/env bash
#
# bootstrap installs things.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

echo ''

info () {
	printf "[ \033[00;34m..\033[0m ] $1\n"
}

user () {
	printf "\r[ \033[0;33m??\033[0m ] $1 "
}

success () {
	printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

setup_vundle () {
	if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
	then
		info 'Setting up Vundle'

		mkdir -p $HOME/.vim/bundle
		git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
		success 'Vundle'
	fi
}

setup_prezto () {
	if [ ! -d "$HOME/.zprezto" ]
	then
		info 'Setting up Prezto'

		git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
		for rcfile in `find $HOME/.zprezto/runcoms/ -type f -not -name 'README.md'`
		do
			ln -s "$rcfile" "$HOME/.${rcfile:t}"
		done
	fi
}

link_file () {
	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
	then

		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
		then

			local currentSrc="$(readlink $dst)"

			if [ "$currentSrc" == "$src" ]
			then

				skip=true;

			else

				user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac

			fi

		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]
		then
			rm -rf "$dst"
			success "removed $dst"
		fi

		if [ "$backup" == "true" ]
		then
			mv "$dst" "${dst}.backup"
			success "moved $dst to ${dst}.backup"
		fi

		if [ "$skip" == "true" ]
		then
			info "skipped $src"
		fi
	fi

	if [ "$skip" != "true" ]	# "false" or empty
	then
		ln -s "$1" "$2"
		success "linked $1 to $2"
	fi
}

install_dotfiles () {
	info 'installing dotfiles'

	local overwrite_all=false backup_all=false skip_all=false

	if [ "$makeconf" == "true" ] || [ ! -f "$DOTFILES_ROOT/.dotfiles/install.conf" ]
	then
		INSTALLED=()
		for Dir in $(ls -d $DOTFILES_ROOT/.dotfiles/*/)
		do
			no_trail_slash=${Dir%%/}
			folder=${no_trail_slash##*/}
			confirm "$folder"
		done
		for item in ${INSTALLED[*]}
		do
			echo $item >> $DOTFILES_ROOT/.dotfiles/install.conf
		done
	else
		while read line
		do
			if [ ! -d "$DOTFILES_ROOT/.dotfiles/$line" ]
			then
				fail "Error reading previous config at $DOTFILES_ROOT/.dotfiles/install.conf"
			else
				confirm "$folder"
			fi
		done < "$DOTFILES_ROOT/.dotfiles/install.conf"
	fi
}

confirm_module () {
	local folder=$1
	user "Do you want to install $folder? Y/N "
	read -n 1 action
	printf "\n"

	case "$action" in
		Y )
			INSTALLED+=("$folder")
			info "Installing $folder"
			install_module "$folder"
			;;
		N )
			info "Skipped $folder"
			;;
		* )
			;;
	esac
}
install_module () {
	local folder=$1
	for src in $(find "$DOTFILES_ROOT/$folder" -maxdepth 2 -name '*.symlink')
	do
		dst="$HOME/.$(basename "${src%.*}")"
		link_file "$src" "$dst"
	done
}

setup_vundle
setup_prezto
install_dotfiles

echo ''
echo '	All installed!'
