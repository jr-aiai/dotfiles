# install zsh and set it as default shell
sudo apt update
sudo apt install zsh -y

export NONINTERACTIVE=1

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo apt update
sudo apt-get install build-essential
brew install gcc
brew install lsd

# install sheldon
if ! command -v sheldon &> /dev/null
then
    sudo curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | sudo bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin
fi
# sheldon init --shell zsh

# install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# paste symbolic links
mkdir -p ~/.config/sheldon
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.config/sheldon/plugins.toml ~/.config/sheldon
ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml

# set default shell to zsh
sudo chsh -s $(which zsh)
zsh -c "source ~/.zshrc"
