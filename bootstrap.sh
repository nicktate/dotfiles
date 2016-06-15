#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Bootstrapping $(whoami)'s computer"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Source utility functions
. $DIR/scripts/util.sh

# Prompt user for all configuration options
. $DIR/scripts/configuration.sh

# Install brew
scripts/brew.sh

# Install brew-cask formulas
scripts/brew-cask.sh

# Configure osx
scripts/osx_setup.sh

# Ensure that submodules are up-to-date
git submodule update --init --recursive

# VIMRC CONFIG
link_file "$DIR/vim/vimrc" "$HOME/.vimrc"
link_file "$DIR/vim/vim" "$HOME/.vim"

# TMUX CONFIG
link_file "$DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# Bash Config
link_file "$DIR/bash/bash_profile" "$HOME/.bash_profile"
if ! grep -q $(which bash) "/etc/shells"; then
    sudo -s 'echo "$(which bash)" >> "/etc/shells"'
fi

# Zsh Config
link_file "$DIR/zsh/zprezto" "$HOME/.zprezto"
$DIR/zsh/bootstrap.sh
link_file "$DIR/zsh/zshrc" "$HOME/.zshrc"
link_file "$DIR/zsh/zpreztorc" "$HOME/.zpreztorc"
if ! grep -q $(which zsh) "/etc/shells"; then
    sudo -s 'echo "$(which zsh)" >> "/etc/shells"'
fi

case $TDC_SHELL_CHOICE in
        [zsh]* )
                echo "zsh install..."
                chsh -s $(which zsh);
                ;;
        [bash]* )
                echo "bash install..."
                chsh -s $(which bash);
                ;;
        * ) echo "no shell choice";;
esac

# Install vundle
vim +PluginInstall +qall

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Tweetbot" "Twitter" "iCal" "iTerm2"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
