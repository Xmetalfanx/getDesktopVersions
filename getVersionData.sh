#!/bin/bash

. configs/loadInfo.cfg

######################################################


function getDesktopInfo()
{
 
  #clear
  echo -e "Getting Desktop info for $1"
  echo
  echo -e "Warning: this MAY take a few seconds"

  # Arch Linux
  getArchInfo "$1"

  # Debian 
  getDebianInfo "$1"

  # Fedora
  getFedoraInfo "$1"

  getOpenSuseInfo "$1"

  # Ubuntu
  getUbuntuVersionInfo "$1"

}

function displayDesktopInfo()
{
  
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
function getAndDisplayDEInfo()
{
  # $1 is the desktop name in string form
  currentDesktop=$1

  getDesktopInfo "$currentDesktop"

  displayDesktopInfo

  clearVars

}

# Cinnamon
getAndDisplayDEInfo "cinnamon"
userPrompt

# Mate
getAndDisplayDEInfo "mate"
userPrompt

# Plasma 5 / KDE Desktop 
getAndDisplayDEInfo "plasma-desktop"