#!/bin/sh

# xup.sh - do xrdb stuff
# i will not write this in perl when sh will do nicely (as much as i want to)
# we're assuming that the dotfiles were correctly installed or were done manually

HOSTNAME=$(hostname)

# TODO don't make $OVRD dependent on hostname, just symlink it to .xovrds in
#      the installer
OVRD="$HOME/.xovrds-$HOSTNAME"
XRES="$HOME/.Xresources"
XRDB=$(which xrdb)

CMD1="$XRDB -load $XRES"
CMD2="$XRDB -merge $OVRD"

if [ -e "$OVRD" ]
 then
  eval "$CMD1"
  eval "$CMD2"
  echo "loaded .Xresources file and any $HOSTNAME overrides"
  exit 1
 else
  eval "$CMD1"
  echo "loaded .Xresources file; no overrides to load for $HOSTNAME"
  exit 1
fi


