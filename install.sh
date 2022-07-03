#!/bin/bash

# Title: 			Installation Script for archlinux
# Author:			Marcel "kernel0verflow" Schliwka
# Creation Date:	2022/07/01
# Type:				Shell Script


printf '\033c' # Clear the terminal
pacman --noconfirm -Sy archlinux-keyring
echo "Welcome to my ArchLinux Installation Script!"
echo "This will help you install Arch quickly"
echo "---------------------------------------"
echo ""
echo ""
lsblk
echo "Enter your Keyboard Layout: "
read keymap
loadkeys keymap
echo "Enter a drive: " 
read drive
echo "You selected $drive"
fdisk /dev/$drive
echo "Enter the root partition: "
read rootpartition
mkfs.ext4 /dev/$rootpartition
echo "Did you create a EFI Partition? (y/n): "
read efianswer
if [[ $efianswer = "y" ]] ; then
	echo "Enter your EFI Partition: "
	read efipartition
	mkfs.vfat -F 32 /dev/$efipartition
fi
echo "Did you create a SWAP Partition? (y/n): "
read swapanswer
if [[ $swapanswer = "y" ]] ; then
	echo "Enter your SWAP Partition: "
	read swappartition
	mkswap /dev/$swappartition
	swapon /dev/$swappartition
fi
mount /dev/$rootpartition /mnt
if [[ $efianswer = "y" ]] ; then
	mkdir -p /mnt/boot/efi
	mount /dev/$efipartition /mnt/boot/efi
fi

# Installing the base system
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab