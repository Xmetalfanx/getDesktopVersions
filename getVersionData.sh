#!/bin/bash

. configs/loadInfo.cfg

######################################################

function getDesktopInfo()
{
 
  clear
  echo -e "Getting Desktop info for $1\n"
  echo -e "Warning: this MAY take a few seconds"

  # Arch Linux
  echo "Getting Arch info"
  getArchInfo "$1"

  # Debian
  echo "Getting Debian info"
  # # Seems slow at times ... maybe I can optimize this
  getDebianInfo "$1"

  # Fedora
  echo "Getting Fedora info"
  getFedoraInfo "$1"

  echo "Getting OpenSuse info"
  getOpenSuseInfo "$1"

  # # Ubuntu
  echo "Getting Ubuntu info"
  getUbuntuInfo "$1"

}

function displayDesktopInfo() {

  clear
  echo -e "------------------------------"
  echo -e "$desktop INFO"

  displayArchInfo
  displayDebianInfo
  displayFedoraInfo
  displayOpenSuseInfo
  displayUbuntuInfo
}

###########################################################################

# Meta function idea ... not sure if this makes sense or is just extra code
function getAndDisplayDEInfo() {
  # $1 is the desktop name in string form
  currentDesktop=$1

  getDesktopInfo "$currentDesktop"

  displayDesktopInfo

  clearVars

}

function get-gtk3-info() {
  # Budgie
  getAndDisplayDEInfo "budgie"

  # Cinnamon (all but for Mint i think )
  getAndDisplayDEInfo "cinnamon"

  getAndDisplayDEInfo "gnome-desktop"

  getAndDisplayDEInfo "xfce"

}

function get-qt-info() {

  #Plasma 5 / KDE Desktop 
  getAndDisplayDEInfo "plasma-desktop"

}


get-gtk3-info
get-qt-info

getAndDisplayDEInfo "mate"
getAndDisplayDEInfo "openbox"

# ***** UNTESTED
getAndDisplayDEInfo "lxde"
getAndDisplayDEInfo "lxqt"

# Linux Mint
# aren't mate and xfce coming from upstream Ubuntu?
getMintInfo "cinnamon"
