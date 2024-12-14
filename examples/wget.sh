#!/usr/bin/env sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Import scripts
. downlib/main.sh

# Download with wget
downlib_dl wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.4.tar.xz out/dl