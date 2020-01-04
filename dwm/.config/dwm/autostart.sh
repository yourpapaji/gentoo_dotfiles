#!/usr/bin/env dash

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run unclutter --timeout 2
run redshift -l 30.73629:76.7884
run /usr/libexec/polkit-gnome-authentication-agent-1
run clipmenud
run fehbg-random
#run picom -b --config $XDG_CONFIG_HOME/picom.conf
run compton -b --config $XDG_CONFIG_HOME/compton.conf
run dwm-status2d
run mpd --no-daemon
run pcmanfm --daemon-mode
run dunst
