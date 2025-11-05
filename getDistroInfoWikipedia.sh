#!/bin/bash 


function get_wikipedia_info() {
    # $1 = distro
    # $2 release being looked for

    distro=${1}
    desired_release=${2}

    wikipediaURL="https://en.wikipedia.org/wiki/${distro}"

    curl -s ${wikipediaURL} | grep "${desired_release}" | tidy -i
}

