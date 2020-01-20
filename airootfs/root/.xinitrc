#!/usr/bin/env sh

echo "$@"
. ~/.xprofile
(
	fcitx &
	gkrellm &
	tint2 &
	urxvt &
	dunst &
	xcompmgr &
#	picom &
	parcellite &
	pasystray &
#	xosview2 &
	lxpolkit &
	icewm
)
