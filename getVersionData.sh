function userPrompt() {
  read -p "Press [Enter] to continue "
}

# include file to get Debian Version info 
echo -e "Getting Arch Linux info"
. configs/getArchVersions.cfg
userPrompt


echo -e "Getting Debian info"
. configs/getDebianVersions.cfg
