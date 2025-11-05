#!/bin/bash

# to get distro release info
function get_arch_based_distro_info () {
    latest_arch_release=$(curl -s "https://archlinux.org/download/" | awk '/Current Release/ { print $3 } ' | sed 's/<.*$//')

    latest_manjaro_release=$(curl -s "https://forum.manjaro.org/c/announcements/releases/19" | awk '/released/ { print; exit }' | sed "s/^.*Manjaro //g;s/released.*$//" )

}

# latest__release
function get_debian_based_distro_info () {
    latest_debian_stable_release=$(curl -s "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/" | awk '/.iso/ && /href/ { print $8; exit }' | sed 's/^.*debian-//;s/-.*//')
    latest_mxlinux_release=$(curl -s "https://mxlinux.org/download-links/" | awk '/Current Release:/ { print $4 }' | sed 's/<.*$//')

}

function get_fedora_based_distro_info() {

}

function get_openSUSE_based_distro_info() {

}

# keeping "based" just to stay consistant with naming 
function get_solus_based_distro_info() {
    latest_solus_release=$(curl -s "https://getsol.us/blog/" | awk '/Released/ && !/</ { print; exit}' | sed "s/Solus //;s/ Released//")
}

function get_ubuntu_based_distro_info() {
    latest_ubuntu_release=
    latest_ubuntu_LTS_release=
}
