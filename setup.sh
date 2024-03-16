#! /bin/bash

# creates directory for roboto fonts
mkdir -p /usr/share/fonts/roboto

# downloads fonts from google fonts
fonts=("Flex" "Slab" "Serif" "Mono")

for font in "${fonts[@]}"; do 
    wget -P /tmp "https://fonts.google.com/download?family=Roboto+${font}"
    unzip "/tmp/download?family=Roboto+${font}" -d /usr/share/fonts/roboto
done

# rebuilds font cache
fc-cache -fv

# sets system default fonts
gsettings set org.gnome.desktop.interface font-name 'Roboto Flex Regular 11'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Serif Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Roboto Mono 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Roboto Flex Bold 11'

# sets font scaling
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2