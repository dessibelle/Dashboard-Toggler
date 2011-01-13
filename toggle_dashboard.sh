#!/bin/bash
result=`defaults read com.apple.dashboard mcx-disabled`
if [ "$result" -eq "1" ] ; then
	defaults write com.apple.dashboard mcx-disabled -boolean NO 
	echo "1"
else
	defaults write com.apple.dashboard mcx-disabled -boolean YES 
	echo "0"
fi
killall Dock