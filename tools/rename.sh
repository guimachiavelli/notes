#!/usr/bin/sh

if [ $# -eq 0 ]
then
    echo 'no folder supplied'
else
    for f in $1/*.* ; do
        clean=${f//$1/}
        clean=${clean,,}
        clean=${clean%.*}
        # next, replace spaces with underscores
        clean=${clean// /_}
        clean=${clean//--/-}

        # now, clean out anything that's not alphanumeric or an underscore
        clean=${clean//[^a-zA-Z0-9_]/}.md

        timestamp=$(stat -nf'%B' "$f")
        date=$(date -r ${timestamp} '+%Y_%m_%d')

        cp "$f" "$2/${date}-${clean}"
    done
fi
