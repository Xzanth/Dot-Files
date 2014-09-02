setup_terminess () {
	info 'Setting up Terminess font'
	if [ -d "$DOTFILES_ROOT/tmp" ]; then rm -rf "$DOTFILES_ROOT/tmp"; fi
	mkdir "$DOTFILES_ROOT/tmp"
	git clone https://github.com/Lokaltog/powerline-fonts $DOTFILES_ROOT/tmp/powerline-fonts
	if [ ! -d "$HOME/.fonts" ]; then mkdir "$HOME/.fonts"; fi
	mv $DOTFILES_ROOT/tmp/powerline-fonts/Terminus/PCF $HOME/.fonts/Terminess
	fc-cache -f
	rm -rf $DOTFILES_ROOT/tmp
	success 'Terminess installed'
}

if [ ! -d "$HOME/.fonts/Terminess" ]
then
	setup_terminess
fi
