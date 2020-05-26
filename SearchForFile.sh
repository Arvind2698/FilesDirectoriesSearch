#!/bin/bash
echo PROGRAM TO FIND A FILE ANYWHERE IN THE PARENT OR SUB DICTIONARIES

read -p "Enter the name of the file you want to search" fileToSearch

allFiles=$(ls -R)
pattern='[a-zA-Z0-9._-]+\.[a-zA-Z0-9]+'
findCounter=0
for file in $allFiles
do
    if [[ $file =~ $pattern ]]
    then
        if [[ "$file" == "$fileToSearch" ]]
        then
            echo FILE FOUND $file
            ((findCounter++))
        fi
    fi
done

if [[ $findCounter -eq 0 ]]
then
    echo FILE NOT FOUND
fi


