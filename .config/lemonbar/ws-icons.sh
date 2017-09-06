#!/bin/bash

#WS=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
WS=$1

case $WS in
    0) 
        echo -e "\uf2c6"
        ;;
    1)
        echo -e "\uf0ad"
        ;;
    2)
        echo -e "\uf269"
        ;;
    3)
        echo -e "\uf121"
        ;;
    4)
        echo -e "\uf073"
        ;;
    5)
        echo -e "\uf120"
        ;;
    6)
        echo -e "\uf003"
        ;;
    7)
        echo -e "\uf069"
        ;;
    8)
        echo -e "\uf1fc"
        ;;
    9)
        echo -e "\uf001"
        ;;
esac
