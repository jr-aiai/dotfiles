# berw install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install sheldon
if ! command -v sheldon &> /dev/null
then
    sudo curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | sudo bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin
fi
sheldon init --shell zsh

# if zsh is not installed, install it
if ! command -v zsh &> /dev/null
then
    brew install zsh
fi  

# paste symbolic links
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon

# set default shell to zsh
chsh -s $(which zsh)
source ~/.zshrc
