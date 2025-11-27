#!/bin/bash

solus_package_search_url="https://soluspkg.osyn.us/"

desktop_package="mate-desktop"


function filter_solus_pass1() {
    awk -v package="$desktop_package" '
        /<table/     { table=""; in=1 }   # start collecting table
        in           { table = table $0 "\n" }
        /<\/table>/  {
            in=0
            if (table ~ package) print table    # print the whole table only if it contains the match
        }
        ' solus.html
}

function filter_solus_pass1_try2() {
    awk -v package="$desktop_package" '
    /<table/     { table=""; in=1 }
    in           { table = table $0 "\n" }
    /<\/table>/  {
        in=0
        if (table ~ package) print table
    }
    ' solus.html

}

filter_solus_pass1_try2
