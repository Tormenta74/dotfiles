#!/bin/bash

CALFILE=.cal
WEEK=3

make

for i in `seq 1 8`; do
    Y=$(($i * 21 + 100))
    # oh lord
    cat $CALFILE | head -n $i | tail -n 1 | dzen2 -w 200 -x 100 -y $Y -p &
done
