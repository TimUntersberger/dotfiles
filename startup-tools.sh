homesick clone https://github.com/TimUntersberger/dotfiles &&
sudo apt install zsh tmux -y &&
curl -L git.io/antigen > ~/.antigen.zsh &&
chsh $(which zsh) &&
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage &&
chmod u+x nvim.appimage && 
sudo mv nvim.appimage /usr/bin/nvim &&
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
vim +PlugInstall +q +q &&
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
~/.tmux/plugins/tpm/scripts/install_plugins.sh
