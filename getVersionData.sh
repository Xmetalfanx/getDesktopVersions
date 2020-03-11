function userPrompt() {
  read -p "Press [Enter] to continue "
}

clear
echo -e "Loading Arch Linux file"
. configs/getArchVersions.cfg

echo -e "Loading Debian file"
. configs/getDebianVersions.cfg

#echo -e "Loading OpenSuse file"
#echo -e "note to self: this may not be right, at the moment"
#. configs/getOpenSuseVersions.cfg

echo -e "Loading Ubuntu file"
. configs/getUbuntuVersions.cfg


######################################################
function getDesktopInfo()
{
 
  clear
  echo -e "Getting Desktop info about $desktop"

  # Arch Linux
  getArchVersion "cinnamon"

  # Debian 
  getDebianInfo "cinnamon"

  #getOpenSuseVersions "cinnamon"

  # Ubuntu
  getUbuntuVersionInfo "cinnamon"

}

function displayDesktopInfo()
{
  clear
  echo -e "CINNAMON INFO"
  displayArchVersion

  displayDebianInfo

  #showOpenSuseInfo

  displayUbuntuVersions
}

# Meta function idea ... not sure if this makes sense or is just extra code
function getAndDisplayDEInfo()
{
  # PROBABLY not needed
  desktop=$1

  getDesktopInfo $desktop

  displayDesktopInfo
}

getAndDisplayDEInfo "cinnamon"