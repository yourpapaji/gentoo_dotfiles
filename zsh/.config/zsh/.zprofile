export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export GPG_TTY=$(tty)
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx -- vt1 -br +bs -dpi 96
