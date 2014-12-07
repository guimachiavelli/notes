#!/usr/bin/sh

if [ $# -eq 0 ]
then
    echo 'no folder supplied'
else
    for f in $1/* ; do
        clean=${f//$1/}
        clean=${clean,,}
        clean=${clean%.*}
        # next, replace spaces with underscores
        clean=${clean// /_}
        clean=${clean//--/-}

        # now, clean out anything that's not alphanumeric or an underscore
        clean=$1/${clean//[^a-zA-Z0-9_-]/}.md

        mv "$f" "${clean}"
        #echo $clean
        #echo $1
    done
fi
