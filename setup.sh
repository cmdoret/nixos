#!/usr/bin/env bash

read -rp "Enter Your New Hostname: [ default ] " hostName
if [ -z "$hostName" ]; then
  hostName="default"
fi

echo "-----"

read -rp "Enter Your Hardware Profile (GPU)
Options:
[ amd ]
nvidia
nvidia-laptop
intel
vm
Please type out your choice: " profile
if [ -z "$profile" ]; then
  profile="amd"
fi

echo "-----"

mkdir hosts/"$hostName"
cp hosts/default/*.nix hosts/"$hostName"
installusername=$(echo $USER)
git config --global user.name "$installusername"
git config --global user.email "$installusername@gmail.com"
git add .
git config --global --unset-all user.name
git config --global --unset-all user.email
sed -i "/^\s*host[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$hostName\"/" ./flake.nix
sed -i "/^\s*profile[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$profile\"/" ./flake.nix


read -rp "Enter your keyboard layout: [ us ] " keyboardLayout
if [ -z "$keyboardLayout" ]; then
  keyboardLayout="us"
fi

sed -i "/^\s*keyboardLayout[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$keyboardLayout\"/" ./hosts/$hostName/variables.nix

echo "-----"

read -rp "Enter your console keymap: [ us ] " consoleKeyMap
if [ -z "$consoleKeyMap" ]; then
  consoleKeyMap="us"
fi

sed -i "/^\s*consoleKeyMap[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$consoleKeyMap\"/" ./hosts/$hostName/variables.nix

echo "-----"

sed -i "/^\s*username[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$installusername\"/" ./flake.nix

echo "-----"

echo "Generating The Hardware Configuration"
sudo nixos-generate-config --show-hardware-config > ./hosts/$hostName/hardware.nix

echo "-----"

echo "Setting Required Nix Settings Then Going To Install"
NIX_CONFIG="experimental-features = nix-command flakes"

echo "-----"

sudo nixos-rebuild switch --flake ${PWD}#${profile}
