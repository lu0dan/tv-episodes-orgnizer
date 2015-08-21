#!/bin/bash
# ---------------------------------------------------------
# TEO trigger script for Transmission
# by luodan@gmail.com
# v0.9 2015.08.21
# ---------------------------------------------------------

CDIR=`dirname "$0"`
[ -f "$CDIR/teo.conf"] && . "$CDIR/teo.conf"
[ "x$TR_TORRENT_NAME" != "x" ] && $CDIR/run.sh "$TR_TORRENT_DIR/$TR_TORRENT_NAME" "$LIBRARY_DIRECTORY"
