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

# Ftp
downlib_ftp() {
    address="$1"
    dir="$2"
    args="$3"
    pwd="$4" # {optional}
    user="$5" # {optional}

    # Init the ftp_url var
    ftp_url=""

    # If the username and password are provided use them in the address
    if [ -n "$user" ] && [ -n "$pwd" ]; then
        # Build ftp address with user and password
        ftp_address="ftp://$user:$pwd@$url"
    else
        # Use the address as is if no username/password are provided
        ftp_address="ftp://$url"
    fi

    # Build the curl cmd with parameters for ftp
    ftp_curl_cmd="curl $args $ftp_url -o $dir"

    # Execute the cmd
    eval $ftp_curl_cmd
}

# Sftp
downlib_sftp() {
    address="$1"
    dir="$2"
    args="$3"
    user="$4" # {optional}
    pwd="$5" # {optional}
    ssh_key="$6" # {optional}

    # Init the sftp_url var
    sftp_url=""

    # If the username and password are provided use them in the address
    if [ -n "$user" ] && [ -n "$pwd" ]; then
        # Build sftp address with user and password
        sftp_address="sftp://$user:$pwd@$address"
    elif [ -n "$user" ] && [ -n "$ssh_key" ]; then
        # If ssh key is provided use it in the connection
        sftp_address="sftp://$user@$address"
        curl_cmd="curl -i -u $user --key $ssh_key $args $sftp_url -o $dir"
    else
        # If no username/password or ssh key are provided use standard sftp without auth
        sftp_address="sftp://$address"
        sftp_curl_cmd="curl $args $sftp_url -o $dir"
    fi

    # Build the curl cmd with parameters for sftp
    sftp_curl_cmd="curl $args $sftp_url -o $dir"

    # Execute the cmd
    eval $sftp_curl_cmd
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
