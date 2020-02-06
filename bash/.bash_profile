#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#STARTX at tty automatically
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx -- vt1 -br +bs -dpi 96
fi
