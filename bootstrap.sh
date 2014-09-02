#!/usr/bin/env bash
#
# bootstrap installs things.
set -e

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd)
if [ "$1" == "--makeconf" ]; then MAKE_CONF=true; else MAKE_CONF=false; fi

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
	printf "\r\033[2K[\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
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
				read -u 3 -n 1 action
				printf "\n"

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
						fail "Invalid response";;
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

	if [ "$MAKE_CONF" == true ] || [ ! -f "$DOTFILES_ROOT/install.conf" ]
	then
		INSTALLED=()
		for Dir in $(ls -d $DOTFILES_ROOT/*/)
		do
			no_trail_slash=${Dir%%/}
			folder=${no_trail_slash##*/}
			confirm_module "$folder"
		done 3<&0
		if [ -f "$DOTFILES_ROOT/install.conf" ]; then rm $DOTFILES_ROOT/install.conf; fi
		for item in ${INSTALLED[*]}
		do
			echo $item >> $DOTFILES_ROOT/install.conf
		done
		success "Saved config file as $DOTFILES_ROOT/install.conf"
	else
		info "Loading config from $DOTFILES_ROOT/install.conf"
		while read line
		do
			if [ ! -d "$DOTFILES_ROOT/$line" ]
			then
				fail "Error reading config"
			else
				install_module "$line"
			fi
		done 3<&0 <"$DOTFILES_ROOT/install.conf"
	fi
}

confirm_module () {
	local folder=$1
	user "Do you want to install $folder? Y/N "
	read -n 1 action
	printf "\n"

	case "$action" in
		[yY] )
			INSTALLED+=("$folder")
			install_module "$folder"
			;;
		[nN] )
			info "Skipped $folder"
			;;
		* )
			fail "Invalid response"
			;;
	esac
}

install_module () {
	local folder=$1
	info "Installing $folder"
	if [ -f "$DOTFILES_ROOT/$folder/install.sh" ]; then source $DOTFILES_ROOT/$folder/install.sh; fi
	for src in $(find "$DOTFILES_ROOT/$folder" -name '*.symlink')
	do
		dst=${src##$DOTFILES_ROOT/}
		dst=${dst#*/}
		if [[ $dst == */* ]]
		then
			dir=${dst%/*}
			if [ ! -d "$HOME/.$dir" ]; then mkdir -p "$HOME/.$dir"; fi
		fi
		dst=${dst%.*}
		dst=$HOME/.$dst
		link_file "$src" "$dst"
	done
}

install_dotfiles

success "All installed!"
