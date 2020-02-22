# Setup

## Installed dependencies after completing the setup instructions

* homesick
* zsh
* antigen
* neovim
* vim-plug
* nodejs (is required for coc.nvim)
* n (a nodejs version manager)
* tmux
* tpm
* docker
* docker-compose
* ripgrep

## Additional setup instructions for using x2go (something like an x server) instead of basic ssh

* x2go
* i3
* rofi
* gnome-terminal
* feh

## Lazy

### only tools 

`curl https://raw.githubusercontent.com/TimUntersberger/dotfiles/master/startup-tools.sh | bash`

### full

`curl https://raw.githubusercontent.com/TimUntersberger/dotfiles/master/startup-full.sh | bash`

## homesick

```bash
sudo apt install ruby &&
gem install homesick
```

## zsh | antigen

```bash
sudo apt install zsh -y &&
curl -L git.io/antigen > ~/.antigen.zsh
```

change default shell to zsh

`chsh $(which zsh)`

## neovim | vim-plug

### neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage &&
chmod u+x nvim.appimage && 
sudo mv nvim.appimage /usr/bin/nvim
```

### vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### nodejs

```bash
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n &&
bash n lts
```

### install plugins

`vim +PlugInstall +q +q`

## tmux | tpm

```bash
sudo apt install tmux -y &&
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
~/.tmux/plugins/tpm/scripts/install_plugins.sh
```
install tmux, tpm and install packages

## docker | docker-compose

`sudo apt install docker.io docker-compose -y`

## ripgrep

```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

## x2go

First of all it is important to setup ssh on the server.

either run `export DISPLAY=:1` for the current terminal session or add it to the bashrc/zshrc file to have it set permanently.

### ssh

`sudo apt install openssh-server -y`

openssh-server should automatically configure everything required. It starts a ssh daemon automatically.

`ssh-keygen -f newuser`

generates `newuser` and `newuser.pub` in the .ssh folder. Copy both to the client desktop.

optionally create the `.ssh/authorized_keys` file before running the following command.

`cat ~/.ssh/newuser.pub >> .ssh/authorized_keys`

this just appends the newly created ssh key to the authorized_keys list to give the key access to the server.

### x2goserver

`sudo apt install x2goserver x2goserver-xsession -y`

this configures a service called `x2goserver`. the service has to be manually started.

### x2goclient

install the windows [x2goclient](code.x2go.org/releases/X2GoClient_latest_mswin32-setup.exe)

start the client and create a new session. change the user to your username and select the public ssh key (newuser.pub).

don't forget to select the desired desktop environment (for i3 choose custom and change the command to `i3`).

## i3 | rofi | gnome-terminal | feh

`sudo apt install i3 gnome-terminal feh rofi -y`
