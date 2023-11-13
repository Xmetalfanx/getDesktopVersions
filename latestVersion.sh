#!/bin/bash




function assignVersionVars() {

    desktop=${1}

    # note to self: i am not a fan of my code for Gnome 


    case $desktop in
        budgie) latestVersion=$(curl -s "https://github.com/BuddiesOfBudgie/budgie-desktop/releases" | awk -F 'v' '/tree/ { print $2; exit }' | sed 's/\".*$//') ;;
        
        cinnamon) latestVersion=$(curl -s "https://github.com/linuxmint/cinnamon/tags" | awk '/releases\/tag/ && /[1-9]/ && !/master/ {print $5;exit}' | sed 's/^.*\///' | tr -d \") ;; 

        gnome) latestVersion=$(curl -s "https://release.gnome.org/45/" | awk '/Introducing GNOME/ {print $3}' | sed 's/GNOME//;s/,//' ) ;;

        lxde) latestVersion=$(curl -s "https://github.com/lxde/lxde-common/tags" | awk '/Release/ && /0/ {print $5; exit}' ) ;; 

        lxqt) latestVersion=$(curl -s "https://lxqt-project.org/releases/" | awk '/Release LXQt/ {print $4; exit}' | sed 's/^.*Release//;s/<\/a>.*$//') ;;

        mate) latestVersion=$(curl -s "https://mate-desktop.org/" | awk -F ">" '/released/ { print $4;exit }' | sed 's/&.*$//g' | tr -d \[:space:] ) ;;

        openbox) latestVersion=$(curl -s "https://raw.githubusercontent.com/danakj/openbox/master/CHANGELOG" | awk '/:/ { print; exit }' | tr -d :) ;; 

        plasma5) latestVersion=$(curl -s "https://kde.org/plasma-desktop/" | awk '/Latest/ {print }' | sed 's/^.*<h2>Latest Release://;s/<\/h2>.*$//' | awk '{ print $2}') ;;
        
        xfce) latestVersion=$(curl -s "https://xfce.org/download" | awk '/Stable release/ {print $4}' | sed 's/<.*$//') ;;

    esac 
}


function displayVersion() {

    echo -e "Latest Version of $desktop is $latestVersion"
}

function getDesktopInfo() {

    assignVersionVars "${1}"
    displayVersion "${1}"
}

getDesktopInfo "budgie"
getDesktopInfo "cinnamon"
getDesktopInfo "gnome"
getDesktopInfo "lxde"
getDesktopInfo "lxqt"
getDesktopInfo "mate"
getDesktopInfo "openbox"
getDesktopInfo "plasma5"
getDesktopInfo "xfce"