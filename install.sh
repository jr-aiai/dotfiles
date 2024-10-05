# install zsh and set it as default shell
sudo apt update
sudo apt install zsh -y

export NONINTERACTIVE=1

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo apt update
sudo apt-get install build-essential
brew install gcc

# install sheldon
if ! command -v sheldon &> /dev/null
then
    sudo curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | sudo bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin
fi
# sheldon init --shell zsh

# paste symbolic links
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon

# setup starship
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# set default shell to zsh
chsh -s $(which zsh)
source ~/.zshrc
