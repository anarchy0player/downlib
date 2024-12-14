#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Protocols methods
protocols_methods="scp rsync"

# Scp
downlib_scp() {
    address="$1"
    dir="$2"
    args="$3"
    pwd="$4" # {optional}
    ssh_key="$5" # {optional}

    # If the SSH key is not provided use sshpass with the password
    if [ -z "$ssh_key" ]; then
        if [ -n "$pwd" ]; then
            # If the password is provided use sshpass
            scp_cmd="sshpass -p '$pwd' scp $args $address $dir"
        else
            # If neither the key nor the password is provided use standard SSH without key or password
            scp_cmd="scp $args $address $dir"
        fi
    else
        # If the SSH key is provided use it for the connection
        scp_cmd="scp -i $ssh_key $args $address $dir"
    fi

    # Execute the cmd
    echo "Running: $scp_cmd"
    eval $scp_cmd
}

# Rsync
downlib_rsync() {
    address="$1"
    dir="$2"
    args="$3"
    pwd="$4" # {optional}
    ssh_key="$5" # {optional}

    # If SSH key is not provided use sshpass with password
    if [ -z "$ssh_key" ]; then
        if [ -n "$pwd" ]; then
            # If password is provided use sshpass
            rsync_cmd="sshpass -p '$pwd' rsync $args $address $dir"
        else
            # If neither key nor password is provided use standard SSH without key or password
            rsync_cmd="rsync $args $address $dir"
        fi
    else
        # If SSH key is provided use it for the connection
        rsync_cmd="rsync -e 'ssh -i $ssh_key' $args $address $dir"
    fi

    # Execute the cmd
    eval $rsync_cmd
}
