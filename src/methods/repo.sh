#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Repo methods
repo_methods=("git")

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
