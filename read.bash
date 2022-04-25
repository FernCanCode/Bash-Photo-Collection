#!/bin/bash
#this reads from stdin
#the file contains
#FILE_PATH
#YEAR MONTH DAY
#LOCATION
#PHOTO_NAMES(possible blank)

read file_path
read year month day
read location
read photo_names
echo "Photo: $pnum"
echo "File: $file_path"
echo "Date: $month / $day / $year"
echo "Location: $location"
echo "Names: $photo_names"
