#! /bin/bash

# installs roboto fonts from fedora repository
dnf install google-roboto-fonts google-roboto-mono-fonts

# rebuilds font cache
fc-cache -fv

# sets system default fonts
gsettings set org.gnome.desktop.interface font-name 'Roboto Regular 11'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Roboto Mono 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Roboto Bold 11'

# sets font scaling
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2