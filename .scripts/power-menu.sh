#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

# Available Styles
# >> Styles Below Only Works With "rofi-git(AUR)", Current Version: 1.5.4-76-gca067234
# full     full_circle     full_rounded     full_alt
# card     card_circle     column     column_circle
# row     row_alt     row_circle
# single     single_circle     single_full     single_full_circle     single_rounded     single_text

style="power"
rofi_command="wofi"
uptime=$(uptime -p)
my_hostname=$(hostname)

# Options
shutdown="    Shutdown"
reboot="    Reboot"
logout="    Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p " Power-Menu " -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        sudo shutdown -h now
	;;
    $reboot)
        sudo shutdown -r now
        ;;
    $logout)
        pkill -KILL -u $USER
        ;;
esac
