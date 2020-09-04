#!/bin/bash
games=$(find ~/.steam/steam/steamapps/ -maxdepth 1 -type f -name '*.acf' -exec awk -F '"' '/"appid|name/{ printf $4 "|" } END { print "" }' {} \; | column -t -s '|' | sort -k 2)
names=$(echo "$games" | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')
choice=$(echo "$names" | dmenu)
choice_id=$(echo "$games" | grep "$choice" | awk '{print $1}')
steam -applaunch $choice_id
