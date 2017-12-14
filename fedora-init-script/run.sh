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
sudo yum install ctags ack dos2unix cvs svn  \
	git gitg htop tig xchat tuxcmd terminator \
	wireshark wireshark-gnome telnet httpd \
	docker golang \
	fcitx fcitx-configtool fcitx-sunpinyin vim meld dconf-editor axel \
	google-chrome-stable gimp ibus-sunpinyin thunderbird samba \
	mplayer kmplayer \
	gcc gcc-c++ kernel-PAE expect -y 

##########################config###############################################

# disable selinux
sudo sed -i 's@SELINUX=enforcing@SELINUX=disabled@g' /etc/selinux/config
sudo setenforce 0

# close unuseful services
sudo systemctl disable firewalld && sudo systemctl stop firewalld 

# git config
. ./git-config.sh

##########################update###############################################

# udpate
sudo yum update -y

###############################################################################

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zshrc ~/.zshrc
