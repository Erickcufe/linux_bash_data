#!/bin/sh
echo "What a food do you choose?"
read FOOD

if [ "$FOOD" = "Apple" ]; then
    echo "You are a healthy person"
elif [ "$FOOD" = "Pizza" ]; then
    echo "You are a fat person"
else
    echo "You are a vegetarian"
fi
