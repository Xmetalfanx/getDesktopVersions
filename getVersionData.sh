function userPrompt() {
  read -p "Press [Enter] to continue "
}

# include file to get Debian Version info 
echo -e "Getting Arch Linux info"
. getArchVersions.cfg
userPrompt


echo -e "Getting Debian info"
. getDebianVersions.cfg
