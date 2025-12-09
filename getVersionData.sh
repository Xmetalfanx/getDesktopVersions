#!/bin/bash

. configs/loadInfo.cfg

######################################################

function get_desktop_info()
{

  clear
  echo -e "Getting Desktop info for $1\n"
  echo -e "Warning: this MAY take a few seconds"

  # Arch Linux
  echo "Getting Arch info"
  get_arch_info "$1"

  # Debian
  echo "Getting Debian info"
  # # Seems slow at times ... maybe I can optimize this
  get_debian_info "$1"

  # Fedora
  echo "Getting Fedora info"
  get_fedora_info "$1"

  echo "Getting OpenSuse info"
  get_opensuse_info "$1"

  # # Ubuntu
  echo "Getting Ubuntu info"
  get_ubuntu_info "$1"

}

function display_desktop_info() {

  clear
  echo -e "------------------------------"
  echo -e "$desktop INFO"

  display_debian_info
  display_fedora_info
  display_opensuse_info
  display_ubuntu_info
}

###########################################################################

# Meta function idea ... not sure if this makes sense or is just extra code
function get_and_display_DE_info() {
  # $1 is the desktop name in string form
  currentDesktop=$1

  get_desktop_info "$currentDesktop"

  display_desktop_info

  clearVars

}

function get-gtk3-info() {
  # Budgie
  get_and_display_DE_info "budgie"

  # Cinnamon (all but for Mint i think )
  get_and_display_DE_info "cinnamon"

  get_and_display_DE_info "gnome-desktop"

  get_and_display_DE_info "xfce"

}

function get-qt-info() {

  #Plasma 5 / KDE Desktop
  get_and_display_DE_info "plasma-desktop"

  get_and_display_DE_info "lxqt"
}


get-gtk3-info
get-qt-info

get_and_display_DE_info "mate"
get_and_display_DE_info "openbox"

get_and_display_DE_info "lxde"

# Linux Mint
# aren't mate and xfce coming from upstream Ubuntu?
getMintInfo "cinnamon"
