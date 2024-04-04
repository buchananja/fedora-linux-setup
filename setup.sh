#! /bin/bash

# updates system
sudo dnf upgrade --refresh -y

# installs gnome tweaks
sudo dnf install -y gnome-tweaks

# installs liberation fonts from fedora repository
sudo dnf install -y liberation-fonts

# rebuilds font cache
fc-cache -fv

# sets default terminal font
gsettings reset org.gnome.desktop.interface monospace-font-name

# sets system default fonts to Liberation family
gsettings set org.gnome.desktop.interface font-name 'Liberation Sans Regular 12'
gsettings set org.gnome.desktop.interface document-font-name 'Liberation Serif Regular 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'Liberation Mono Regular 12'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Liberation Sans Bold 12'

# sets font scaling (20% increase)
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2

# installs official fedora multimedia codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia

# install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

# installs r (programming language) with developer add-ons
sudo dnf install -y R R-core R-core-devel R-java R-java-devel libRmath libRmath-devel libcurl-devel openssl-devel harfbuzz-devel fribidi-devel freetype-devel libpng-devel libjpeg-turbo-devel

# installs rstudio
sudo dnf install -y rstudio-desktop

# installs vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[vscode]\nname=packages.microsoft.com\nbaseurl=https://packages.microsoft.com/yumrepos/vscode/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf install -y code

# cleans dnf package manager cache
sudo dnf clean all
