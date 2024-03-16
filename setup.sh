#! /bin/bash

# updates system
sudo dnf upgrade --refresh -y

# installs gnome tweaks
sudo dnf install -y gnome-tweaks

# installs adobe source fonts from fedora repository
sudo dnf install -y adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts

# rebuilds font cache
fc-cache -fv

# sets default terminal font
gsettings reset org.gnome.desktop.interface monospace-font-name

# sets system default fonts
gsettings set org.gnome.desktop.interface font-name 'Source Sans 3 Regular 12'
gsettings set org.gnome.desktop.interface document-font-name 'Source Serif 4 Regular 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Regular 12'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Source Sans 3 Bold 12'

# sets font scaling
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2

# installs official fedora multimedia codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia

# install conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

# installs r with developer dependencies
sudo dnf install -y R R-core R-core-devel R-java R-java-devel libRmath libRmath-devel libcurl-devel openssl-devel harfbuzz-devel fribidi-devel freetype-devel libpng-devel libjpeg-turbo-devel

# installs rstudio
sudo dnf install -y rstudio-desktop

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[vscode]\nname=packages.microsoft.com\nbaseurl=https://packages.microsoft.com/yumrepos/vscode/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf install -y code

# cleans dnf package manager cache
sudo dnf clean all
