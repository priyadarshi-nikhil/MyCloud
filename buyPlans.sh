#!/bin/bash

printf "\nSelect Plans to purchase:\n"
echo 	"--> Choose a Subscription plan..."
echo 	"		1. Monthly	-	5$ per month"
echo 	"		2. Annual	-	50$ per year"
read choice1 

if [ "$choice1" -eq 1 ];then
	sub=monthly
	subCost=5
elif [ "$choice1" -eq 2 ];then
	sub=annual
	subCost=50
else
	echo "Wrong Choice!"
fi


echo 	"--> Choose a Backup plan..."
echo 	"		1. Hourly Backups	-	10$ per month"
echo 	"		2. Daily  Backups	-	 5$ per month"
echo 	"		3. Weekly Backups	-	 3$ per month"
echo 	"		4. Manual Backups	-	50$ per month"
read choice2

if [ "$choice2" -eq 1 ];then
	bkup=hourly
	bkupCost=10

elif [ "$choice2" -eq 2 ];then
	bkup=daily
	bkupCost=5

elif [ "$choice2" -eq 3 ];then
	bkup=weekly
	bkupCost=3

elif [ "$choice2" -eq 4 ];then
	bkup=manual
	bkupCost=50
else
	echo "Wrong Choice!"
fi



echo 	"--> Choose a Storage plan..."
echo 	"		1. 5 GB		-	5$ per month"
echo 	"		2. 10 GB	-	50$ per year"
read choice3 

if [ "$choice3" -eq 1 ];then
	storage=5
	storeCost=5
elif [ "$choice3" -eq 2 ];then
	storage=10
	storeCost=50
else
	echo "Wrong Choice!"
fi




printf "\n\nYou have chosen a $sub plan for $bkup backups upto $storage GB storage in MyCloud!
		Press y|Y to confirm and proceed to cart. Any other key to choose again.\n"

export sub subCost bkup bkupCost storage storeCost

function cart {

total=$((subCost+bkupCost+storeCost))
echo "Orders in your cart:"
echo "*************************************************"
echo "*	$sub Subscription	-	$subCost	*"
echo "*	$bkup Backups		-	$bkupCost	*" 
echo "*	$storage GB Storage		-	$storeCost	*"
echo "*-----------------------------------------------*"
echo "*	GrandTotal		-	$total    	*"
echo "*************************************************"

}

read key
case "$key" in
				[yY] ) cart ;; 
				*)./buyPlans.sh ;;
			esac

printf "\n"
echo "......proceed to pay....press enter!"
read n
./pay.sh

