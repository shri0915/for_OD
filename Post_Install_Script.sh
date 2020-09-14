#!/bin/bash
# My first script
echo "Let us first update the system after install..."
sudo dnf update --assumeyes
echo "Now downloading and installing the 'Extra Repos we need for all the applications to run'"
echo "Adding cheese-release-32"
cd ~
mkdir postinstall_files
cd postinstall_files
wget http://www.nosuchhost.net/~cheese/fedora/packages/32/x86_64/cheese-release-32-3.fc32.noarch.rpm
sudo dnf install ./cheese-release-32-3.fc32.noarch.rpm --assumeyes
echo "Adding RMPFusion (Free and Non-Free)"
wget https://download0.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
wget https://download0.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "Installing Visual Studio Code"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' --assumeyes
sudo dnf check-update
sudo dnf install code --assumeyes
echo "Adding RPM-Sphere"
wget https://github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-32-1.noarch.rpm
sudo dnf install ./rpmsphere-release-32-1.noarch.rpm --assumeyes
echo "Installing Firewall"
sudo dnf install ufw --assumeyes
echo "Setting up the Firewall"
sudo ufw enable
sudo ufw reject SSH
echo "Installing power management software 'TLP'"
sudo dnf install tlp --assumeyes
echo "Installing Pinta (Image editor)"
sudo dnf install pinta --assumeyes
echo "Installing OBS Studio (Screen Recorder)"
sudo dnf install obs-studio --assumeyes
echo "Disabling BlueTooth at startup"
sudo systemctl disable bluetooth.service
echo "Installing backup software 'Timeshift'"
sudo dnf install timeshift --assumeyes
echo "Installing speedtest from OOKLA"
sudo dnf install wget --assumeyes
wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
sudo mv bintray-ookla-rhel.repo /etc/yum.repos.d/
sudo dnf install speedtest
echo "Installing wallpaper app"
cd ~
git clone https://github.com/ChrisTitusTech/wallpaper-reddit.git
cd wallpaper-reddit
sudo python3 setup.py install
echo "To use the wallpaper app try running 'wallpaper-reddit'"
echo "Installing command line YouTube Downloader"
sudo dnf install youtube-dl --assumeyes
echo "Installing VLC"
sudo dnf install vlc --assumeyes
echo "Installing Audacity (Audio Editor)"
sudo dnf install audacity --assumeyes
echo "Installing Eclipse (Development Environment)"
sudo dnf install eclipse --assumeyes
echo "Most of the things needed to give you a start has been added to the system. For more help with software feel free to Google 'How to install <Software_Name> in Fedora 32'"
