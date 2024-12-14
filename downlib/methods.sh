#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

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

    # Build the aria2c command with parameters
    cmd="aria2c $args -d $dir -o $filename $url"

    # Execute the command
    echo "Running: $cmd"
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

    # Build the wget command with parameters
    cmd="wget $args $url -P $dir"

    # Execute the command
    echo "Running: $cmd"
    eval $cmd
}

# Curl
dl_curl() {
    url="$1"
    dir="$2"
    args="$3"

    filename=$(basename "$url")
    filepath="$dir$filename"

    # Build the curl command with parameters
    cmd="curl $args -o $filepath $url"

    # Execute the command
    echo "Running: $cmd"
    eval $cmd
}

# Git
dl_git() {
    url="$1"
    dir="$2"
    args="$3"

    # Build the git command with parameters
    git_cmd="git clone $args $url $dir"

    # Execute the command
    echo "Running: $git_cmd"
    eval $git_cmd
}