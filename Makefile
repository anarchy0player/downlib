# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# +--------------------+
# +        Vars        +
# +--------------------+

# Main
NAME := Downlib
VERSION := 0.0.0

# Dirs
BUILD_DIR := out/
BUILD_DL_DIR := dl/

# Full build dirs
FULL_BUILD_DL_DIR := ${BUILD_DIR}${BUILD_DL_DIR}

# Dirs no slash
BUILD_DIR_NO_SLASH := $(subst /,,${BUILD_DIR})

# +--------------------+
# +        Main        +
# +--------------------+

# Main
all: run

run: mkdir_build
	@./examples/main.sh

clean:
	@rm -rf ${BUILD_DIR}

mkdir_build:
	@mkdir -p ${FULL_BUILD_DL_DIR}

perms:
	@find . -path "${BUILD_DIR_NO_SLASH}" -prune -o \
   		-type d -exec chmod 755 {} + \
    	-o -type f -exec chmod 644 {} +
	@find . -type f \( -name "*.sh" \) -exec chmod +x {} +

chk_scripts:
	@find . -type d \( -name ".git" -o -name "out" \) -prune -o -type f -name "*.sh" -exec shellcheck {} \;

install_deps:
	@apt install -y --no-install-recommends \
		git \
		make \
		shellcheck

help:
	@echo
	@echo " Usage: make <target>"
	@echo
	@echo " Targets:"
	@echo "  run          - Run examples"
	@echo "  help         - Show this help message"
	@echo "  clean        - Clean"
	@echo "  install_deps - Install dependencies with apt"
	@echo "  chk_scripts  - Check scripts"
	@echo "  perms        - Change perms"
	@echo