#!/bin/bash
echo PROGRAM TO FIND A FILE ANYWHERE IN THE PARENT OR SUB DIRECTORIES

read -p "Enter a specific directory to search or Press enter for the current directory" directory
read -p "Enter the name of the file you want to search" fileToSearch

allFiles=$(ls -R $directory )
patternForFile='[a-zA-Z0-9._-]+\.[a-zA-Z0-9]+'
patternForDirectory='\.?/+'
findCounter=0

for file in $allFiles
do
    if [[ $file =~ $patternForDirectory ]]
    then    
        currentDirectory=$file
    fi

    if [[ $file =~ $patternForFile ]]
    then
        if [[ "$file" == "$fileToSearch" ]]
        then
            pathOfFile=$( echo $currentDirectory | awk -F: '{print $1}' )
            echo FILE FOUND
            echo PATH: $pathOfFile/$file
            ((findCounter++))
        fi
    fi
done

if [[ $findCounter -eq 0 ]]
then
    echo FILE NOT FOUND
fi


