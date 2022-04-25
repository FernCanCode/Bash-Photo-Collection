#!/bin/bash
#this reads from stdin
#the File contains
#FILE_PATH
#YEAR MONTH DAY
#LOCATION
#PHOTO_NAMES(possible blank)
function readOldVars() {
read old_file_path
read old_year old_month old_day
read old_location
read old_photo_names
}
FILE="./data/p"$pnum".photo"
readOldVars < "$FILE"

echo "$FILE" > $FILE
while true; do
    read -p "Enter photo year(1950-2050):" pyear
    if [[ $pyear -ge 1950 && $pyear -le 2050 ]]; then
        pyear2=$pyear
        break;
    fi
    if  [[ "$pyear" == "" ]]; then
       pyear2=$old_year
       break;
    fi
    echo "Photo year is not within range."
done

while true; do
    read -p "Enter photo month(1-12):" pmonth
    if [[ $pmonth -ge 1 && $pmonth -le 12 ]]; then
        pmonth2=$pmonth
        break;
    fi
    if [[ "$pmonth" == "" ]]; then
        pmonth2=$old_month
        break;
    fi
    echo "Photo month is not within range."
done

while true; do
    read -p "Enter photo day(1-31):" pday
    if [[ $pday -ge 1 && $pday -le 31 ]]; then
        pday2=$pday
        break;
    fi
    if [[ "$pday" == "" ]]; then
        pday2=$old_day
        break;
    fi
    echo "Photo day is not within range."
done

echo "$pyear2 $pmonth2 $pday2" >> $FILE

while true; do
    read -p "Enter photo location:" plocation
    if [[ "$plocation" == "" ]]; then
        echo "$old_location" >> $FILE
        break;
    else
        echo "$plocation" >> $FILE
        break;
    fi
done

while true; do
    read -p "enter photo names:" pnames
    if [[ "$pnames" == "" ]]; then
        echo "$old_photo_names" >> $FILE
        break;
    else
        echo "$pnames" >> $FILE
    fi
done


echo "`date "+[%Y-%m-%d %H:%M:%S]"` UPDATED: $pnum - $old_file_path - "$pmonth"/"$pday"/"$pyear" -$plocation - $pnames" >> ./data/queries.log
