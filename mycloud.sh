#!/bin/bash

mkdir -p ~/MyCloud/"$name"
echo "Your MyCloud Sync Directory is at $(cd ~/MyCloud/"$name" && pwd)"
echo "Your Files....."
ls ~/MyCloud/"$name"


./landing.sh

