#!/bin/bash

declare -A de_urls=(
    [budgie]="https://github.com/BuddiesOfBudgie/budgie-desktop/releases"
    [cinnamon]="https://github.com/linuxmint/cinnamon/tags"
    [gnome]="https://release.gnome.org/"
    [lxde]="https://github.com/lxde/lxde-common/tags"
    [lxqt]="https://lxqt-project.org/releases/"
    [mate]="https://mate-desktop.org/"
    [openbox]="https://raw.githubusercontent.com/danakj/openbox/master/CHANGELOG"
    [plasma]="https://kde.org/plasma-desktop/"
    [xfce]="https://xfce.org/download"
)

function get_latest_version() {
    local desktop="$1"
    local url="${de_urls[$desktop]}"
    local result=""
    case "$desktop" in
        budgie)
            result=$(curl -s "$url" |
            awk -F 'v' '/tree/ \
                { print $2; exit }' |
            sed 's/\".*$//' \
            ) ;;
        cinnamon)
            result=$(curl -sL "$url" |
            awk '/releases\/tag\/[0-9]/ \
                && !/unstable/ { \
                gsub(/^.*">|<\/a>.*/, "", $8); \
                print $8; \
                exit } '
            ) ;;
        gnome)
            result=$(curl -s "$url" |
            awk '/Introducing GNOME/ \
            { gsub("\">",""); \
            print $5; exit }' ) ;;
        lxde)
            result=$(curl -s "$url" |
            awk '/Release/ && /0/ \
            {print $5; exit}' ) ;;
        lxqt)
            result=$(curl -sL "$url" |
                awk '/Release/ && /LXQt [0-9]/ \
                { print $4; exit } ' | 
                sed "s/<.*$//" ) ;;
        mate)
            result=$(curl -sL "$url" |
                awk '/released/ { \
                gsub("&nbsp.*$",""); \
                print $4; exit }' ) ;;

        openbox)
            result=$(curl -s "$url" |
                awk '/^.*[0-9]/ \
                { gsub(":",""); \
                print; exit} '
            ) ;;
        plasma)
            result=$(curl -sL "$url" |
                tidy -q 2>/dev/null |
                awk '/<h2>Latest Release/ \
                { gsub("</h2>",""); \
                print $4 }' ) ;;
        xfce)
            result=$(curl -sL "$url" |
                awk '/Stable release/ \
                && /[0-9]/ \
                { gsub("</h2>",""); print $4 } ' \
                ) ;;
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

for de in "${!de_urls[@]}"; do
    # get_desktop_info "$de"
    get_desktop_info "$de" >> "$output_file"
done
echo "Output written to $output_file"