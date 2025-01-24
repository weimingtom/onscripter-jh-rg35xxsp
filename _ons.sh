#!/bin/sh
cd $(dirname "$0")
#SDL_VIDEO_FBCON_ROTATION=UD
#/mnt/mmc/ons/ 
./onscripter > a.txt 2>&1
sync
