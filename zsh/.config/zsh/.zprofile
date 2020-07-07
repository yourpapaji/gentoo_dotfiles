export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export $(dbus-launch)
#STARTX at tty automatically
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx -- vt1 -br +bs -dpi 96
fi
