##########################install###############################################

# add google-chrome repo
bit=`uname -i`
if [ "i386" == "$bit" ];then
    sudo cp ./yum.repos.d/google-chrome-32bit.repo /etc/yum.repos.d/
else
    sudo cp ./yum.repos.d/google-chrome-64bit.repo /etc/yum.repos.d/
fi

 sudo cp ./yum.repos.d/vscode.repo /etc/yum.repos.d/


# install tools which are usually used in working
sudo dnf install ctags ack dos2unix cvs svn  \
	git gitg htop tig  tuxcmd terminator \
	wireshark telnet httpd \
	docker golang \
	fcitx fcitx-configtool fcitx-sunpinyin vim meld \
	google-chrome-stable thunderbird samba \
	gcc gcc-c++ expect -y 

##########################config###############################################

# disable selinux
sudo sed -i 's@SELINUX=enforcing@SELINUX=disabled@g' /etc/selinux/config
sudo setenforce 0

# close unuseful services
sudo systemctl disable firewalld && sudo systemctl stop firewalld 

# git config
. ./git-config.sh

##########################update###############################################


###############################################################################

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zshrc ~/.zshrc

# hosts
sudo cp ./update-hosts.sh /usr/bin/ && sudo chmod +x /usr/bin/update-hosts.sh
sudo sh -c /usr/bin/update-hosts.sh
echo "/etc/hosts file lines = `cat /etc/hosts | wc -l`"
sudo crontab -u root ./crontab/updatehosts

# udpate
sudo yum update -y