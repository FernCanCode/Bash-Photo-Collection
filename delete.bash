#!/bin/bash
while true; do
    read -p "Enter a photo number:" pnum
    if [[ -f ./data/p"$pnum".photo ]]; then
        rm -r ./data/p"$pnum".photo
        break;
    fi
    echo "p"$pnum".photo does not exist"
    break;
done

echo " `date "+[%Y-%m-%d %H:%M:%S]"` DELETED: $pnum" >> ./data/queries.log

