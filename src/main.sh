#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Set the base dir
base_dir="$(pwd)"

# Import scripts
for script in $base_dir/src/methods/*.sh; do
    . "$script"
done
