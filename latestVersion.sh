#!/bin/bash

declare -A de_urls=(
    [budgie]="https://github.com/BuddiesOfBudgie/budgie-desktop/releases"
    [cinnamon]="https://github.com/linuxmint/cinnamon/tags"
    [gnome]="https://release.gnome.org/45/"
    [lxde]="https://github.com/lxde/lxde-common/tags"
    [lxqt]="https://lxqt-project.org/releases/"
    [mate]="https://mate-desktop.org/"
    [openbox]="https://raw.githubusercontent.com/danakj/openbox/master/CHANGELOG"
    [plasma5]="https://kde.org/plasma-desktop/"
    [xfce]="https://xfce.org/download"
)

function get_latest_version() {
    local desktop="$1"
    local url="${de_urls[$desktop]}"
    local result=""
    case "$desktop" in
        budgie)
            result=$(curl -s "$url" | awk -F 'v' '/tree/ { print $2; exit }' | sed 's/\".*$//')
            ;;
        cinnamon)
            result=$(curl -s "$url" | awk '/releases\/tag/ && /[1-9]/ && !/master/ {print $5;exit}' | sed 's/^.*\///' | tr -d \" )
            ;;
        gnome)
            result=$(curl -s "$url" | awk '/Introducing GNOME/ {print $3}' | sed 's/GNOME//;s/,//')
            ;;
        lxde)
            result=$(curl -s "$url" | awk '/Release/ && /0/ {print $5; exit}')
            ;;
        lxqt)
            result=$(curl -sL "$url" | awk '/Release/ && /LXQt [0-9]/ { print $4; exit } ' | sed "s/<.*$//")
            ;;
        mate)
            result=$(curl -s "$url" | awk -F ">" '/released/ { print $4;exit }' | sed 's/&.*$//g' | tr -d '[:space:]')
            ;;
        openbox)
            result=$(curl -s "$url" | awk '/:/ { print; exit }' | tr -d :)
            ;;
        plasma5)
            result=$(curl -s "$url" | awk '/Latest/ {print }' | sed 's/^.*<h2>Latest Release://;s/<\/h2>.*$//' | awk '{ print $2}')
            ;;
        xfce)
            result=$(curl -s "$url" | awk '/Stable release/ {print $4}' | sed 's/<.*$//')
            ;;
        *)
            result="Unknown desktop environment"
            ;;
    esac
    echo "$result"
}

function display_version() {
    local desktop="$1"
    local version="$2"
    echo -e "Latest Version of $desktop is $version"
}

function get_desktop_info() {
    local desktop="$1"
    local version
    version=$(get_latest_version "$desktop")
    display_version "$desktop" "$version"
}


# Write output to latest_version.txt
output_file="latest_version.txt"

for de in budgie cinnamon gnome lxde lxqt mate openbox plasma5 xfce; do
    get_desktop_info "$de" >> "$output_file"
done
echo "Output written to $output_file"