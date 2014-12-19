#!/usr/bin/sh

if [ $# -eq 0 ]
then
    echo 'no folder supplied'
else
    echo '<p>Chronologically sorted notes. full of typos and errors. most likely rubbish.</p>'
    echo '<ul class="index">'
    for f in `ls -rv $1` ; do
        name=${f//$1/}
        name=${name////}
        name=${name//.html/}
        name=${name//[0-9_]*-/}
        name=${name//_/ }

        if [ "$name" == "index" ]
            then 
                continue;
        fi

        url=${f//$1/}

        echo "<li><a href='${url}'>${name}</a></li>"
    done
    echo '</ul>'
fi
