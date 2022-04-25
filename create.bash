#!/bin/bash
while true; do
    read -p "Enter the photo number(range 1-99999):" pnum
    if [[ $pnum -ge 1 && $pnum -le 99999 ]]; then

        if [[ -f ./data/p"$pnum".photo ]]; then
            echo "P"$pnum".photo already exists."
        else
            touch ./data/p"$pnum".photo
            break;
        fi
    else
        echo "Photo number $pnum is not within acceptable range."
        
    fi
done
while true; do    
    read -p "Enter the photo file location path:" path
    if [[ ! -f "$path" ]]; then
        echo "The file path does not exist. Please enter a new one."
    else
        break;
    fi
done
while true; do
    read -p "Enter the photo year(1950-2050):" pyear
    if [[ $pyear -ge 1950  && $pyear -le 2050 ]]; then
        break;
    else
        echo "Year $pyear is not within acceptable range."
    fi
done
while true; do
    read -p "Enter the photo month(1-12):" pmonth
    if [[ $pmonth -ge 1 && $pmonth -le 12 ]]; then
        break;
    else
        echo "Month $pmonth is  not in the range 1 to 12."
    fi
done
while true; do
    read -p "Enter the photo day(1-31):" pday
    if [[ $pday -ge 1 && $pday -le 31 ]]; then
        break;
    else
        echo "Day $pday is not within acceptable range."
    fi
done
while true; do
    read -p "Enter photo location(required):" plocation
    if [[ "$plocation" == "" ]]; then
        echo "Please enter a location."
    else
        break;
    fi
done
read -p "Enter names of people in photo(optional):" pnames
FILE=$path
echo "$path" >> $FILE
echo "$pyear $pmonth $pday" >> $FILE
echo "$plocation" >> $FILE
echo "$pnames" >> $FILE
echo "`date "+[%Y-%m-%d %H:%M:%S]"` CREATED: $pnum - $path - "$pmonth"/"$pday"/"$pyear" - $plocation" >> ./data/queries.log
