# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Use base image
FROM debian:bullseye-slim

# Set envs
ENV DEBIAN_FRONTEND=noninteractive

# Update, install deps and clean
RUN apt update && apt upgrade -y && \
  apt install -y --no-install-recommends \
  make shellcheck git ca-certificates \
  rm -rf /var/lib/apt/lists/* && \
  apt clean

# Set working dir
WORKDIR /home/downlib/downlib

# Clone repo
RUN git clone https://github.com/anarchy0player/downlib .
