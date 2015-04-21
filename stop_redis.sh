#!/bin/bash
#dir=${PWD##*/}
dir=${PWD}
cd $dir
#rm -r cn*
sleep 1
master=
[[ ! -f $1 ]] && echo "No hostfile given!" >&2 && exit 1
for i in $(cat "$1"); do
        nohup ssh -n $i "$(type -p /home/dominic/redis-3.0.0/src/redis-cli) shutdown " &
        echo "stopped slave on $i"
    sleep 2
done

