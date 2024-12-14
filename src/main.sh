#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Import scripts
. src/methods/url.sh
. src/methods/repo.sh

# Download function
downlib_dl() {
    method="$1"        # Download method (default is aria2c)
    url="$2"           # URL for downloading
    dir="$3"           # Directory for downloading
    args="$4"          # Additional arguments

    # Determine which method to use
    # Check if the method is in url_methods
    found=0
    for m in $url_methods; do
        if [ "$m" = "$method" ]; then
            found=1
            break
        fi
    done

    if [ $found -eq 1 ]; then
        # Call the corresponding function for URL-based methods (aria2c, wget, curl)
        "dl_$method" "$url" "$dir" "$args"
        return
    fi

    # Check if the method is in repo_methods
    found=0
    for m in $repo_methods; do
        if [ "$m" = "$method" ]; then
            found=1
            break
        fi
    done

    if [ $found -eq 1 ]; then
        # Call the corresponding function for repository-based methods (git)
        "dl_$method" "$url" "$dir" "$args"
        return
    fi

    # If the method is not supported
    echo "Error: Unsupported method '$method'. Supported methods are: $url_methods and $repo_methods"
    return 1
}
