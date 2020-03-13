. configs/loadInfo.cfg

######################################################


function getDesktopInfo()
{
 
  #clear
  echo -e "Getting Desktop info for $1"

  # Arch Linux
  #getArchVersion "$1"

  # Debian 
  #getDebianInfo "$1"

  getOpenSuseVersions "$1"

  # Ubuntu
  #getUbuntuVersionInfo "$1"

}

function displayDesktopInfo()
{
  
  # clear
  echo -e "------------------------------"
  echo -e "$desktop INFO"

  #displayArchVersion
  #displayDebianInfo
  displayOpenSuseInfo
  #displayUbuntuVersions  
}

###########################################################################

# Meta function idea ... not sure if this makes sense or is just extra code
function getAndDisplayDEInfo()
{
  # $1 is the desktop name in string form
  currentDesktop=$1

  getDesktopInfo $currentDesktop

  displayDesktopInfo

  clearVars

}

getAndDisplayDEInfo "cinnamon"

userPrompt 
getAndDisplayDEInfo "mate"

