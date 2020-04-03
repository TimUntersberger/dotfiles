curl https://raw.githubusercontent.com/TimUntersberger/dotfiles/master/startup-tools.sh | bash &&
sudo apt install i3 suckless-tools feh rofi -y &&
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh &&
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty
