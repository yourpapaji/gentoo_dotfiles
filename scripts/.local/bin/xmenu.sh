#!/bin/sh

cat <<EOF | xmenu -i | sh &
Applications
	Web Browser	firefox
	Image editor	gimp
Terminal (Alacritty)	alacritty
Terminal (St)		st

Shutdown		poweroff
Reboot			reboot
EOF
