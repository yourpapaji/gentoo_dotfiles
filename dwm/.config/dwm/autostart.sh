#!/usr/bin/env dash

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/libexec/geoclue-2.0/demos/agent
run /usr/libexec/polkit-gnome-authentication-agent-1
run clipmenud
run unclutter --timeout 2
run redshift
run fehbg-random
#run picom -b --config $XDG_CONFIG_HOME/picom.conf
run compton -b --config $XDG_CONFIG_HOME/compton.conf
run dwm-status2d
run mpd --no-daemon
run pcmanfm --daemon-mode
run dunst
