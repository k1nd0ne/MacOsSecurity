#!/bin/zsh
######################################################################
# Author : k1nd0ne                                                   #
#                                                                    #
# Creation Date : 01/05/2020                                         #
#                                                                    #
# Description : This script can be used on MacOSX 10.13 and above.   #
#                                                                    #
######################################################################

# This script is based on the drduh macOS-Security-and-Privacy-Guide
# I've decided to keep some tips of this hardening for my Own Mac
# You are responsible if your Mac is not working proprely after thoses actions

# Script Execute well on MacOs Catalina
# The script will guide throught and inform you of what actions are made in details

echo -e "
███    ███ ██   ██ ███████ 
████  ████ ██   ██ ██      
██ ████ ██ ███████ ███████ 
██  ██  ██ ██   ██      ██ 
██      ██ ██   ██ ███████ 
                           
-MacOs Hardening Script-

Author : k1nd0ne
"
#You can comment actions you don't want to take in the script routine function bellow :
#Just comment the function refering to the action you don't want to take.
script_routine () {
 fileVault
 EvictFileVault
 EndScriptTips
}

fileVault () {
    echo -n "Activating fileVault disk encryption..."
    sudo fdesetup enable
    echo "done"
}

EvictFileVault(){
    echo -n "Enforcing system hibernation and evicting FileVault keys from memory instead of traditional sleep to memory..."
    sudo pmset -a destroyfvkeyonstandby 1
    sudo pmset -a hibernatemode 25
    echo "done"
    echo -n "Setting up new power management policies..."
    sudo pmset -a powernap 0
    sudo pmset -a standby 0
    sudo pmset -a standbydelay 0
    sudo pmset -a autopoweroff 0
    echo "done"
}

EndScriptTips (){
    echo "Execution finished."
    echo "Consider setting a Firmware password."
    echo "See : https://support.apple.com/en-au/HT204455"
    echo "Please Reboot your machine."
}

#Displaying warning messages
echo "WARNING : This script will install/disable certain MacOs functionalities."
echo "If you didn't review the script I recommend going throught it first."
echo " "
while true; do
    read -p "I have read the script and agree to go (Y/n): " yn
    case $yn in
        [Yy]* ) script_routine; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
