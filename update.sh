#!/bin/bash

if [ "$1" = "full" ] ; then
    param=module
else
    param=only
fi

# store hash of current HEAD
oldhead=$(git rev-parse HEAD)

echo "Updating super module..."
git pull origin master

if [ $? -ne 0 ] ; then
    echo "ERROR while updating super module"
    exit 1
fi

# This checks whether the update script itself changed
newhead=$(git rev-parse HEAD)
git diff --exit-code $oldhead $newhead -- update.sh >/dev/null
if [ $? -ne 0 ] ; then
    echo "The update script changed, re-running for possible bug fixes..."
    ./update.sh
    exit $?
fi


echo "Updating modules..."
git submodule update

if [ $? -ne 0 ] ; then

    echo "ERROR: There was a problem updating the submodules"
    exit 1
fi

