#!/bin/sh

if [ -d zip ] ; then
    mkdir -p "unzip"
    for f in zip/*.zip ; do
        unzip -j -u "$f" -d "unzip/"
    done
else
    echo "zip doesn't exist, run make downloadTiles"
    exit 1
fi
