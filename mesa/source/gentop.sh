#!/bin/sh
CARD=Sixi25_x9card
PIN=G540x2_34


cat top/TopPCIHostMot2.vhd | sed s/"--use work.$CARD.all"/"use work.$CARD.all"/g | sed s/"--use work.PIN_$PIN.all"/"use work.PIN_$PIN.all"/g | sed s/TopPCIHostMot2/tophm2/g > 6i25_$PIN.vhd

# cat top/TopUSBHostMot2.vhd
# cat top/TopEthernet16HostMot2.vhd 

