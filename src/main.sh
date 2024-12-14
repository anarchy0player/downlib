#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Import scripts
for script in src/methods/*.sh; do
    . "$script"
done
