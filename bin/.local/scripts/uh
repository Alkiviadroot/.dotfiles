#!/usr/bin/env bash

RED="\e[1;4;31m"
GREEN="\e[1;4;32m"
BLUE="\e[1;4;34m"
CYAN="\e[1;4;36m"
WHITE="\e[1;4;97m"
ENDCOLOR="\e[0m"

if [ $# -eq 0 ]; then
	PAGES=10
else
	PAGES=$1
fi

arrLinks=()

for n in $(seq 1 $PAGES); do
	LINK=$(curl -s "https://unboxholics.com/news/gaming?page=${n}" | grep "dorean" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u)
	clear
	echo "Sanned $n/$PAGES Pages"
	arrLinks+=($LINK)
done

clear

echo -e "${RED}\n➤ PC ${ENDCOLOR}"
for link in "${arrLinks[@]}"; do
echo $link | grep -E "pc"
done

echo -e "${BLUE}\n➤ STEAM ${ENDCOLOR}"
for link in "${arrLinks[@]}"; do
echo $link | grep -E "steam"
done

echo -e "${WHITE}\n➤ EPIC ${ENDCOLOR}"
for link in "${arrLinks[@]}"; do
echo $link | grep -E "epic"
done

echo -e "${CYAN}\n➤ PLAYSTATION ${ENDCOLOR}"
for link in "${arrLinks[@]}"; do
echo $link | grep -E "playstation|ps-plus"
done

echo -e "${GREEN}\n➤ XBOX ${ENDCOLOR}"
for link in "${arrLinks[@]}"; do
echo $link | grep -E "xbox"
done
