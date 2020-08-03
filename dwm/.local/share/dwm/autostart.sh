#!/usr/bin/env dash

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# run /usr/libexec/at-spi-bus-launcher --launch-immediately
# run /usr/libexec/geoclue-2.0/demos/agent
# run lxqt-policykit-agent
# run start-pulseaudio-x11
# run xdg-user-dirs-update
# run dunst

run pcmanfm-qt --daemon-mode
run redshift
run clipmenud
run unclutter --timeout 2
run fehbg-random
run picom --dbus --daemon --config $XDG_CONFIG_HOME/picom.conf
run gamemoded -d
run mpd
run dwm-status2d
