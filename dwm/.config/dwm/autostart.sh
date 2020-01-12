#!/usr/bin/env dash

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/libexec/geoclue-2.0/demos/agent
run /usr/libexec/polkit-gnome-authentication-agent-1
run aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log
run clipmenud
run unclutter --timeout 2
run redshift
run fehbg-random
run picom -b --config $XDG_CONFIG_HOME/picom.conf
run dwm-status2d
run mpd --no-daemon
run pcmanfm --daemon-mode
run transmission-daemon --paused
run dunst
