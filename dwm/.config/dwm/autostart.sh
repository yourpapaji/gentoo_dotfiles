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
run fehbg-random
run picom --dbus --daemon --config $XDG_CONFIG_HOME/picom.conf
run dwm-status2d
run pcmanfm --no-desktop --daemon-mode
