#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Repo methods
repo_methods="git svn"

# Git
downlib_git() {
    url="$1"
    dir="$2"
    args="$3"

    # Build the git cmd with parameters
    git_cmd="git clone $args $url $dir"

    # Execute the command
    eval $git_cmd
}

# Svn
downlib_svn() {
    url="$1"
    dir="$2"
    args="$3"

    # Build the svn cmd with parameters
    svn_cmd="svn checkout $args $url $dir"

    # Execute the cmd
    eval $svn_cmd
}

# Mercurial
downlib_hg() {
    url="$1"
    dir="$2"
    args="$3"

    # Build the hg cmd with parameters
    hg_cmd="hg clone $args $url $dir"

    # Execute the cmd
    eval $hg_cmd
}

# Bazaar
downlib_bzr() {
    url="$1"
    dir="$2"
    args="$3"

    # Build the bzr cmd with parameters
    bzr_cmd="bzr branch $args $url $dir"

    # Execute the cmd
    eval $bzr_cmd
}
