#!/bin/bash

cd "$1"
while read line       
do       
     OldImageName="${line%;*}" # check divider if not working: ; or ,
     OldExt="${OldImageName##*.}"
     NewImageName="${line#*;}.$OldExt" # check divider here too if not working: ; or ,

     # printf '%s\t%s\n' "$OldImageName" "$NewImageName"

     if [ -e "$OldImageName" ] ; then
          mv "$OldImageName" "$NewImageName"
     else
          echo "$OldImageName" >> ~/Desktop/Errors.txt
     fi
     # Remove CR but not NL
done < <(perl -lne '$_ =~ s/\015?//g && print;' "$2")
exit 0

# USING:
# Create an Automator Program:
# 1. Get Finder objects: Folders
# 2. Set Variable name: FolderName
# 3. Get Finder objects: Files
# 4. Run [this] Shell script: As arguments

# Stolen from here: https://discussions.apple.com/thread/250060990
# Author: https://discussions.apple.com/profile/VikingOSX
