#!/bin/sh

# SPDX-License-Identifier: MIT
# Copyright (c) 2024, Kolya

# Display the menu
show_menu() {
    echo
    echo " # Select an action"
    echo
    echo " #0 | Download with wget"
    echo " #1 | Download with wget (use args)"
    echo " #2 | Exit"
    echo
}

# Process user input
read_choice() {
    printf " # Enter your choice: "
    read -r choice
    case "$choice" in
        0)
            ./examples/wget.sh
            ;;
        1)
            ./examples/wget_args.sh
            ;;
        2)
            echo "Exiting the examples"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again"
            ;;
    esac
}

# Main loop
while true
do
    show_menu
    read_choice
    echo
done
