#!/bin/bash
#

function options {
echo -e "1.first\n2.second\n3.third"
read a
echo $a
}
options
#a=$(options)

case $a in
        1) echo "selected 1"
                ;;
        2) echo "selected 2"
                ;;
        3) echo "selsected 3"
                ;;
        *) echo "please select 1-3"
		a=$(options)  ;;
esac

