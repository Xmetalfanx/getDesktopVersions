. configs/loadInfo.cfg

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
  echo -e "$desktop INFO"
  
  
  
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

  # Clear var
  # echo here for testing 
  echo -e "Clearing desktop var"
  desktop=""
}

getAndDisplayDEInfo "cinnamon"

getAndDisplayDEInfo "mate-desktop"


# testing for now 
function xfceInfo
{
  # works on Debian and Ubuntu 
  getAndDisplayDEInfo "xfce4"

}

