#!/usr/bin/env bash

#
# Configuration variables
#
ARK_DIR="/volume1/ArkServer"
ARK_BACK="${ARK_DIR}/backup"
ARK_GAME_ID=376030
ARK_FILES="${ARK_DIR}/arkdedicated"


cd ${ARK_DIR}

#
# Add a file named "enable_rcon" to the ARK_DIR to get rcon to run
#
if [ -f enable_rcon ]; then
  ARK_RCON="?RCONEnabled=True?RCONPort=32330"
fi

#
# Install steamcmd if it isn't already installed
#
if [ ! -f steamcmd_linux.tar.gz ]; then
  echo -e "Installing SteamCMD.\n"
  wget -q https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
  tar -xf steamcmd_linux.tar.gz
fi

#
# Backup server files every time you boot the image
#
if [ -d ${ARK_FILES}/ShooterGame/Saved ]; then
  echo -e "Backing up saved folder.\n"
  if [ ! -d ${ARK_BACK} ]; then
    mkdir -p ${ARK_BACK}
  fi
  tar czf "${ARK_BACK}/saved-startup_$(date +%Y-%m-%d_%H-%M).tar.gz" "${ARK_FILES}/ShooterGame/Saved"
fi

#
# Only update if told to, otherwise it takes 30 minutes or more to start!
# Delete the "delete_to_validate_update" file to have it install, update, or validate
# If you have server file issues delete the file, if you want to update delete the file
#
if [ ! -f delete_to_validate_update ]; then
  touch delete_to_validate_update
  # Update / install server
  echo -e "Installing, Updating, and Validating ARK server files.\n"
  ./steamcmd.sh +login anonymous +force_install_dir "${ARK_FILES}" +app_update ${ARK_GAME_ID} validate +quit
fi

#
# Get ready to start the Ark server
#
cd ${ARK_FILES}/ShooterGame/Binaries/Linux/
export LD_LIBRARY_PATH="${ARK_FILES}"

#
# Let the server admin know what's running
#
command_line="TheIsland?listen${ARK_RCON} -server -log"
echo -e "Launching ARK server using: ${command_line}\n"

#
# Start the sever
# Don't edit this file to configure the server, instead edit
# the server edit the GameUserSettings.ini file at:
# 
#
./ShooterGameServer ${command_line}
