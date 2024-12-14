#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Protocols methods
protocols_methods="rsync"

# Rsync
downlib_rsync() {
    url="$1"
    dir="$2"
    args="$3"
    pwd="$4" # {optional}
    ssh_key="$5" # {optional}

    # If SSH key is not provided use sshpass with password
    if [ -z "$ssh_key" ]; then
        if [ -n "$pwd" ]; then
            # If password is provided use sshpass
            rsync_cmd="sshpass -p '$pwd' rsync $args $url $dir"
        else
            # If neither key nor password is provided use standard SSH without key or password
            rsync_cmd="rsync $args $url $dir"
        fi
    else
        # If SSH key is provided use it for the connection
        rsync_cmd="rsync -e 'ssh -i $ssh_key' $args $url $dir"
    fi

    # Execute the cmd
    eval $rsync_cmd
}
