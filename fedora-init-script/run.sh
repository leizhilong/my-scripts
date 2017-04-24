##########################install###############################################

# install fastestmirror plugin
sudo yum install yum-plugin-fastestmirror -y

# add rpmfusion repo
sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
sudo rpm -ivh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm

# add google-chrome repo
bit=`uname -i`
if [ "i386" == "$bit" ];then
    sudo cp ./google-chrome-repo-32.txt /etc/yum.repos.d/google-chrome.repo
else
    sudo cp ./google-chrome-repo-64.txt /etc/yum.repos.d/google-chrome.repo
fi

# add fast fedora repo
sudo cp ./fedora-163.repo /etc/yum.repos.d/
sudo cp ./fedora-updates-163.repo /etc/yum.repos.d/
sudo cp ./fedora-sohu.repo /etc/yum.repos.d/
sudo cp ./fedora-updates-sohu.repo /etc/yum.repos.d/

# install tools which are usually used in working
sudo yum install ctags ack dos2unix cvs svn git gitk qgit tig xchat tuxcmd terminator wireshark wireshark-gnome telnet httpd fcitx fcitx-configtool fcitx-sunpinyin vim meld dconf-editor axel google-chrome-stable gimp ibus-sunpinyin thunderbird samba mplayer kmplayer gcc gcc-c++ kernel-PAE expect -y 
# install tools for video
sudo yum install gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly libtunepimp-extras-freeworld xine-lib-extras-freeworld gnash smplayer vlc ffmpeg ffmpeg-libs gstreamer-ffmpeg libmatroska xvidcore -y

##########################config###############################################

# disable selinux
sudo sed -i 's@SELINUX=enforcing@SELINUX=disabled@g' /etc/selinux/config

# close unuseful services
sudo chkconfig iptables off
sudo chkconfig ip6tables off
sudo chkconfig sendmail off

# turn on sshd
sudo chkconfig sshd on

# append alias 
cat ./alias.txt >> ~/.bashrc

# git config
. ./git-config.sh

# sudo sed -i "/title_vertical_pad/s/value=\"[0-9]\{1,2\}\"/value=\"0\"/g" /usr/share/themes/Adwaita/metacity-1/metacity-theme-3.xml

##########################update###############################################

# udpate
sudo yum update -y

##########################remind###############################################

# install jdk 1.6

echo ">>>>>>>>>>>>>>>>>>Remeber to copy jdk-6u45-linux-i586-rpm.bin or jdk-6u45-linux-x64-rpm.bin here!!!"

chmod +x jdk-6u45-linux-*-rpm.bin

if [ "i386" == "$bit" ];then
    sudo ./jdk-6u45-linux-i586-rpm.bin
	## java ##
	sudo alternatives --install /usr/bin/java java /usr/java/jdk1.6.0_45/jre/bin/java 20000
	## javaws ##
	sudo alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.6.0_45/jre/bin/javaws 20000
	 
	## Java Browser (Mozilla) Plugin 32-bit ##
	sudo alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so libjavaplugin.so /usr/java/jdk1.6.0_45/jre/lib/i386/libnpjp2.so 20000

	## Install javac only if you installed JDK (Java Development Kit) package ##
	sudo alternatives --install /usr/bin/javac javac /usr/java/jdk1.6.0_45/bin/javac 20000
	sudo alternatives --install /usr/bin/jar jar /usr/java/jdk1.6.0_45/bin/jar 20000

else
    sudo ./jdk-6u45-linux-x64-rpm.bin

	## java ##
	sudo alternatives --install /usr/bin/java java /usr/java/jdk1.6.0_45/jre/bin/java 20000
	## javaws ##
	sudo alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.6.0_45/jre/bin/javaws 20000
	 
	## Java Browser (Mozilla) Plugin 64-bit ##
	sudo alternatives --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/jdk1.6.0_45/jre/lib/amd64/libnpjp2.so 20000
	 
	## Install javac only if you installed JDK (Java Development Kit) package ##
	sudo alternatives --install /usr/bin/javac javac /usr/java/jdk1.6.0_45/bin/javac 20000
	sudo alternatives --install /usr/bin/jar jar /usr/java/jdk1.6.0_45/bin/jar 20000
fi

cat jdkhome.txt >> ~/.bashrc
source ~/.bashrc
echo "JAVA_HOME is [$JAVA_HOME]"




echo ">>>>>>>>>>>>>>>>>>Remeber to install ant and set ANT_HOME"
echo ">>>>>>>>>>>>>>>>>>Remeber to install maven and set M2_HOME"
echo ">>>>>>>>>>>>>>>>>>Remeber to config id_rsa for git"

