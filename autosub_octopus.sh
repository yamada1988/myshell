#!/bin/bash

subcmd='qsub'
statcmd='qstat'
script='md_sigma_add.sh'
line0='1'

for it in `seq 0 72000`
do

tit=`expr $it % 360`
if [ $tit == 0 ]; then
  echo "################"
  date
  $statcmd
fi

line1=`qstat | grep p0.90`
lc0=${#line0}
lc1=${#line1}
if [ $lc0 -gt $lc1 ]; then
    date
    $subcmd $script
  #fi
fi

sleep 10

done
