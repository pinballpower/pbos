#!/bin/bash
cd `dirname $0`
openocd -f raspberrypi-swd-dmdreader.cfg -f target/rp2040.cfg -c "program dmdreader.elf verify reset exit"
echo
if [ "$?" == "0" ]; then
 echo "RP2040 programmed sucessfully"
else
 echo "Couldn't program RP2040"
 exit 1
fi
