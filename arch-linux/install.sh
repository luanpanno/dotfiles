echo '-------------------------------------------------'
echo '       Linux Development Setup - Luan Panno      '
echo '             Arch Linux - install.sh             '
echo '-------------------------------------------------\n'

set -x
sudo pacman -Syu git base-devel terminator zsh gnome-browser-connector gnome-keyring libsecret seahorse nodejs npm yarn ttf-fira-code

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S google-chrome visual-studio-code-bin

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions