curl https://raw.githubusercontent.com/TimUntersberger/dotfiles/master/startup-tools.sh | bash &&
sudo apt install openssh-server -y &&
ssh-keygen -f newuser &&
cat ~/.ssh/newuser.pub >> .ssh/authorized_keys &&
sudo service ssh start &&
sudo apt install x2goserver x2goserver-xsession &&
sudo service x2goserver start &&
sudo apt install i3 suckless-tools xterm feh -y
