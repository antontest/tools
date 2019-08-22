#! /bin/bash
# Name : update_file.sh
# Func : 
# Time : 2019-07-12 20:39:21

n=0
set +x
p=$(echo $1 | sed "s/\/+$//p")/
shift

all=$(echo "$@" | sort | uniq)
p=$(echo "$p" | sed -n "s/\//\\\\\//gp")
for d in ${all[@]}; do
    if [ ! -f $d ]; then
        let n=$n+1
        continue
    fi

    c=$(echo "$d" | sed -n "s/.d$/.o/p")
    f=$(sed -n "s/^\([^:]*\).*$/\1/p" $d)

    for file in ${f[@]}; do
        if [[ $file = $c ]]; then
            file=$(echo "$file" | sed -n "s/${p}\(.*\).o/\1/p")
        fi
        if [[ $file -nt $c ]]; then
            let n=$n+1
            break
        fi
    done
done

echo $n
