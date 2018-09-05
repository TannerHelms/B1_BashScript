#!/bin/bash
clear
echo "What process do you want to do (update, upgrade, autoclean, autoremove, all)"
read answer
case "$answer" in
     update)
        clear
        sudo apt update -y
        echo "Finished updating captain"
        ;;
     upgrade)
        clear
        sudo apt upgrade -y
        echo "Upgraded everything"
        ;;
     autoclean)
        clear
        sudo apt autoclean -y
        echo "Cleaned all the cobwebs from the corners"
        ;;
     autoremove)
        clear
        sudo apt autoremove -y
        echo "Removed all the junk"
        ;;
     all)
        clear
        sudo apt update -y
        read -p "Updated, press [enter] to continue"
        sudo apt upgrade -y
        read -p "Upgraded everything, press [enter] to continue"
        sudo apt autoclean -y
        read -p "Cleaned, press [enter] to continue"
        sudo apt autoremove -y
        echo "Removed the junk"
        ;;
    *)
        echo "Please try typing with more precision next time"
        exit 1

esac
read -p "Press enter to exit"
clear
exit 1


