#!/bin/bash
if [ ! -d "$data" ]; then
    mkdir data
    touch data/queries.log
fi
while [ 0 ]; do
    echo "Enter one of the follow actions or press CTRL-D to exit."
    echo "C - create a new photo item"
    echo "R - read an existing photo item"
    echo "U - update an existing photo item"
    echo "D - delete an existing photo item"
    echo "Q - quit"
    if ! read ans; then
        break
    fi
    case "$ans" in
        [Cc])
                bash create.bash
            ;;
        [Rr])
                while true; do
                    read -p "Enter a photo number:" pnum
                    if [[ -f ./data/p"$pnum".photo ]]; then
                        FILE="./data/p"$pnum".photo"
                        export pnum
                        bash read.bash < $FILE
                        break;
                    else
                        echo "p"$pnum".photo does not exist."
                        break;
                    fi
                done
            ;;
        [Uu])
                while true; do
                    read -p "Enter a photo number:" pnum
                    if [[ -f ./data/p"$pnum".photo ]]; then
                        FILE="./data/p"$pnum".photo"
                        export pnum
                        bash update.bash 
                        break;
                    else
                        echo "p"$pnum".photo does not exist."
                        break;
                    fi
                done
            ;;
        [Dd])
            bash delete.bash
            ;;
        [Qq])
            break
            ;;
        *) echo "ERROR: invalid option: '$ans'"
            ;;
    esac
done
