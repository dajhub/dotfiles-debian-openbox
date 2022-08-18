#!/bin/bash
set -e

echo "Creating folders for later use"

[ -d $HOME"/Documents" ] || mkdir -p $HOME"/Documents"
[ -d $HOME"/Pictures" ] || mkdir -p $HOME"/Pictures"
[ -d $HOME"/Downloads" ] || mkdir -p $HOME"/Downloads"

[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"

[ -d $HOME"/.config/geany" ] || mkdir -p $HOME"/.config/geany"


[ -d $HOME"/.local/share/themes" ] || mkdir -p $HOME"/.local/share/themes"
[ -d $HOME"/.local/share/xfce4/terminal/colorschemes" ] || mkdir -p $HOME"/.local/share/xfce4/terminal/colorschemes"
[ -d $HOME"/.config/gtk-3.0" ] || mkdir -p $HOME"/.config/gtk-3.0"


echo "###############################################"
echo "### Personal folders created or existed already"
echo "###############################################"
