sudo apt install ruby -y &&
gem install homesick &&
homesick clone https://github.com/TimUntersberger/dotfiles &&
sudo apt install zsh tmux docker.io docker-compose -y &&
curl -L git.io/antigen > ~/.antigen.zsh &&
chsh $(which zsh) &&
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage &&
chmod u+x nvim.appimage && 
sudo mv nvim.appimage /usr/bin/nvim &&
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n &&
bash n lts &&
vim +PlugInstall +q +q &&
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
~/.tmux/plugins/tpm/scripts/install_plugins.sh &&
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&
sudo dpkg -i ripgrep_11.0.2_amd64.deb
