#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Url methods
url_methods="aria2c wget curl"

# Aria2c
dl_aria2c() {
    url="$1"
    dir="$2"
    args="$3"

    filename=$(basename "$url")
    filepath="$dir$filename"

    # Check if the file already exists
    if [ -f "$filepath" ]; then
        return 0
    fi

    # Build the aria2c cmd with parameters
    cmd="aria2c $args -d $dir -o $filename $url"

    # Execute the cmd
    eval $cmd
}

# Wget
dl_wget() {
    url="$1"
    dir="$2"
    args="$3"

    filename=$(basename "$url")
    filepath="$dir$filename"

    # Check if the file already exists
    if [ -f "$filepath" ]; then
        return 0
    fi

    # Build the wget cmd with parameters
    cmd="wget $args $url -P $dir"

    # Execute the cmd
    eval $cmd
}

# Curl
dl_curl() {
    url="$1"
    dir="$2"
    args="$3"

    filename=$(basename "$url")
    filepath="$dir$filename"

    # Build the curl cmd with parameters
    cmd="curl $args -o $filepath $url"

    # Execute the cmd
    eval $cmd
}
