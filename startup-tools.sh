sudo apt install ruby zsh tmux docker.io docker-compose git -y &&
sudo gem install homesick &&
homesick clone https://github.com/TimUntersberger/dotfiles &&
curl -L git.io/antigen > ~/.antigen.zsh &&
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage &&
chmod u+x nvim.appimage && 
sudo mv nvim.appimage /usr/bin/nvim &&
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n &&
sudo chmod +x ./n &&
sudo mv ./n /usr/bin/n
sudo n lts &&
nvim +PlugInstall +q +q &&
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&
sudo dpkg -i ripgrep_11.0.2_amd64.deb &&
homesick link
