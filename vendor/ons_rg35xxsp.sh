#!/bin/sh

. /mnt/mod/ctrl/configs/functions &>/dev/null 2>&1
progdir=$(cd $(dirname $0); pwd)

cd /mnt/mmc/ons/

#https://steward-fu.github.io/website/handheld/rg28xx_volume.htm
amixer set 'lineout volume' 10

./onscripter
sync
exit 0
