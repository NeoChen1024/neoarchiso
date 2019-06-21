#!/usr/bin/env sh

echo "$@"
. ~/.xprofile
(
	fcitx &
	gkrellm &
	tint2 &
	urxvt &
#	clipit &
	dunst &
	xcompmgr &
	pasystray &
	xosview2 &
	exec sawfish
)
