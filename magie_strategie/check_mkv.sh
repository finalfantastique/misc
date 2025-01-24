#!/usr/bin/env bash

files=`ls scripts/script_*.txt`

for file in $files
do
    echofmt "{bold}{grey}$file"
    names=`grep "\- atk_2024" $file | cut -d' ' -f2`
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
