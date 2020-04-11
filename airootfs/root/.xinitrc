#!/usr/bin/env sh

echo "$@"
. ~/.xprofile
(
	wind -f '#000' -b '#fff' -F '#fff' -B '#404040' &
	fcitx &
	tint2 &
	dunst &
	xcompmgr &
	parcellite &
	pasystray &
	urxvt
)
