#!/usr/bin/env bash

files=`ls script/*.txt`

for file in $files
do
    echofmt "{bold}{grey}$file"
    names=`grep "\- avec_le_destin__" $file | cut -d' ' -f2`
    for name in $names
    do 
        fres=`find -name "$name.mkv"`

        if [[ -z "$fres" ]]
        then
            fres=`find ~/studio -name "$name.mkv"`
            if [[ -z "$fres" ]]
            then
                echofmt "{red}  $name"
                echo -n
            else
                echofmt "{yellow}  $name"
                echo -n
            fi
        else
            echofmt "{green}  $fres"
            echo -n
        fi
    done
done
