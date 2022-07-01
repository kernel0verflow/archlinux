#!/bin/bash

# Title: 			Installation Script for archlinux
# Author:			Marcel "kernel0verflow" Schliwka
# Creation Date:	2022/07/01
# Type:				Shell Script


printf '\033c' # Clear the terminal
echo "Welcome to my ArchLinux Installation Script!"
echo "This will help you install Arch quickly"
echo "---------------------------------------"
echo ""
echo ""
lsblk
echo "Enter a drive: "
read drive
drive="/dev/$drive"
echo "You selected $drive"
