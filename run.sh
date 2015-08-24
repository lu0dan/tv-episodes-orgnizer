#!/bin/bash
# -------------------------
# TV Episodes Orgnizer
# by luodan@gmail.com
#
# v0.9.2 2015.08.24
# -------------------------

is_video(){
	[ "x$VIDEO_FILE_EXTENSIONS" == "x" ] && VIDEO_FILE_EXTENSIONS="avi|mkv|wmv|m4v|mp4"
	return `echo "$1"|awk '{s=match($0, /\.('$VIDEO_FILE_EXTENSIONS')$/)?0:1;}END{print s;}'`
}

is_tvshow(){
	BNAME=`basename "$1"|tr '[a-z]' '[A-Z]'`
	[ "$BNAME" == "${BNAME//S[0-9][0-9]E[0-9][0-9]/}" ] && return 1 || return 0
}

split_tvshow(){
	SE=`echo "$1"|awk '{$0=toupper($0);print match($0,/S[0-9][0-9]E[0-9][0-9]/)?substr($0,RSTART,RLENGTH):"";}'`
	SEASON=${SE:1:2}
	EPISODE=${SE:4:2}
	TITLE=`basename "$1"|awk '{print match($0,/[sS][0-9][0-9][eE][0-9][0-9]/)?toupper(substr($0,1,1))substr($0,2,RSTART-3):$0;}'`
	[ "x$SE" == "x" ] && IS_TVSHOW=0 || IS_TVSHOW=1
	#echo split "$1" into title="$TITLE" season="$SEASON" episode="$EPISODE"
}

move_to_lib(){
	split_tvshow "$1"
	[ "$IS_TVSHOW" == "0" ] && echo Not a TV episode file or directory.
	TARGET_DIR="$LIBRARY_DIRECTORY/$TITLE/Season.$SEASON/"
	echo "Moving $1"
	echo "    to $TARGET_DIR"
	mkdir -p "$TARGET_DIR"
	mv "$1" "$TARGET_DIR"
}

process(){
	local FORD="$1"
	[ -d "$FORD" ] && FORD=`cd "$FORD"; pwd`
		
	BFORD=`basename "$FORD"`
	[ "${BFORD:0:1}" == "." -o "${BFORD:0:1}" == "@" ] && echo "Skipping $BFORD" && return

	if [ -f "$FORD" ]; then
		if is_tvshow "`dirname "$FORD"`"; then
			move_to_lib "`dirname "$FORD"`"
		elif is_tvshow "$FORD"; then
			move_to_lib "$FORD"
		else
			echo Skipping file "$BFORD"
		fi
	elif [ -d "$FORD" ]; then
		if is_tvshow "$FORD"; then
			move_to_lib "$FORD"
		else
			if [ `ls -1 "$FORD"|wc -l` -gt 0 ]; then
				local SUBFORD
				for SUBFORD in "$FORD"/*; do
					process "$SUBFORD"
				done
			fi
			if [ `ls -1 "$FORD"|wc -l` -eq 0 ]; then
				rm -rf "$FORD"
			fi
		fi
	else
		echo Skipping unknown file "$BFORD"
	fi
}

CDIR=`dirname "$0"`
[ -f "$CDIR/teo.conf" ] && . "$CDIR/teo.conf"
[ "x$LIBRARY_DIRECTORY" == "x" -o ! -d "$LIBRARY_DIRECTORY" -o ! -w "$LIBRARY_DIRECTORY" ] && echo Library directory not exists or not accessable. Please check teo.conf && exit 1
LIBRARY_DIRECTORY=`cd "$LIBRARY_DIRECTORY"; pwd`

for ARG in "$@"; do
	if [ "${ARG:0:1}" != "-" -a "$ARG" != "/" ]; then
		process "$ARG"
	fi
done
