##########################install###############################################
dnf erase libreoffice* qemu* libvirt* -y
dnf update -y
dnf install fedora-workstation-repositories -y
dnf config-manager --set-enabled google-chrome

# add vscode repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update

# install tools which are usually used in working
dnf install ctags ack dos2unix cvs svn  \
	git gitg htop tig zsh tuxcmd terminator \
	wireshark telnet httpd filezilla \
	golang rust nodejs pacmanager \
	vim code meld \
	google-chrome-stable thunderbird samba \
	gcc gcc-c++ expect the_silver_searcher -y

##########################config###############################################

# disable selinux
sed -i 's@SELINUX=enforcing@SELINUX=disabled@g' /etc/selinux/config
setenforce 0

# close unuseful services
systemctl disable firewalld && sudo systemctl stop firewalld

# git config
git config --global user.name "Zhilong Lei"
git config --global user.email "leizhilong@me.com"
git config --global color.ui true
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.up "pull --rebase"
git config branch.master.mergeoptions --ff-only

###############################################################################

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zshrc ~/.zshrc

# hosts
cp ./update-hosts.sh /usr/bin/ && sudo chmod +x /usr/bin/update-hosts.sh
sh -c /usr/bin/update-hosts.sh
echo "/etc/hosts file lines = `cat /etc/hosts | wc -l`"
crontab -u root ./crontab/updatehosts

