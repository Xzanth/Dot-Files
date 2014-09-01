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

setup_prezto
