##########################install###############################################
dnf erase libreoffice* qemu* libvirt* cheese rhythmbox gnome-maps gnome-photos -y
dnf autoremove
dnf clean all
dnf check-update
dnf update -y
dnf install fedora-workstation-repositories -y
dnf config-manager --set-enabled google-chrome

# add vscode repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# install tools which are usually used in working
dnf install ctags ack dos2unix cvs svn \
	git gitg htop tig zsh terminator \
	wireshark telnet httpd filezilla \
	golang rust nodejs  \
	vim code meld pacmanager \
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

###############################################################################

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# cp ./zshrc ~/.zshrc

cat << EOF
## TODO add these to ~/.zshrc
ZSH_THEME="gentoo"

...

plugins=(
  git
  mvn
  docker
  npm
  nvm
  pip
  python
  kubectl
  helm
  man
  python
  golang
  rsync
  systemd
  yarn
)

...

alias l='ls -ltr'
alias c='clear'
alias f='find . -iname'
alias p='ps -ef|grep java'
alias grep='grep --color=always'
EOF


echo "All done, Good luck!"