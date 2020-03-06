#!/bin/bash

line0='1'

for it in `seq 0 72000`
do

tit=`expr $it % 360`
if [ $tit == 0 ]; then
  echo "################"
  date
  qstat
fi

line1=`qstat | grep p0.90`
lc0=${#line0}
lc1=${#line1}
if [ $lc0 -gt $lc1 ]; then
  #echo $line1 
  #stat1=`echo $line1 | grep RUN` 
  #statc1=${#stat1}
  #if [ $lc0 -gt $statc1 ]; then
    #echo $stat1
    date
    qsub md_sigma_add.sh
  #fi
fi

sleep 10

done
