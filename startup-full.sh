curl https://raw.githubusercontent.com/TimUntersberger/dotfiles/master/startup-tools.sh | bash &&
sudo apt install openssh-server x2goserver x2goserver-xsession i3 suckless-tools gnome-terminal feh -y &&
ssh-keygen -f newuser &&
cat ~/.ssh/newuser.pub >> .ssh/authorized_keys &&
sudo service ssh start &&
sudo service x2goserver start
