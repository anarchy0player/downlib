#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Import scripts
. src/methods/url.sh

# Dl
downlib_dl() {
    method="${1:-aria2c}"
    url="$2"
    dir="$3"
    args="$4"

    # Check which utility was provided and call the corresponding method
    case "$method" in
        aria2c)
            dl_aria2c "$url" "$dir" "$args"
            ;;
        wget)
            dl_wget "$url" "$dir" "$args"
            ;;
        curl)
            dl_curl "$url" "$dir" "$args"
            ;;
        git)
            dl_git "$url" "$dir" "$args"
            ;;
        *)
            echo "Only aria2c, wget, curl, and git are supported. Invalid method received: $method"
            return 1
            ;;
    esac
}
