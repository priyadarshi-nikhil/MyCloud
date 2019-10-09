#!/bin/bash

echo "Welcome to MyCloud!"
echo "Press:"
echo 	"1. Sign Up"
echo 	"2. Login"

read choice

if [ "$choice" -eq 1 ]; then
	./signup.sh
fi
if [ "$choice" -eq 2 ]; then
	./login.sh
fi