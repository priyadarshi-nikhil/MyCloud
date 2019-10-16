#!/bin/bash
echo 
echo "Hi $name! Welcome to smart view."
echo "Press:"
echo "	1. See available backups"
echo "	2. See changes from current state"
echo "	3. Restore to a previous state."
echo "	0. Previous Menu"

read cho
export cho
case "$cho" in
				1) ./listBkups.sh ;;
				2) ./listCompOpt.sh ;;
				3) ./restoreList.sh ;;
				0) ./landing.sh ;; 
				*) 	echo "You entered something else." ;;
			esac








./sview.sh