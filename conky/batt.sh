#!/bin/sh
power=$(cat /sys/class/power_supply/BAT*/power_now | paste -sd+ | bc)
energy=$(cat /sys/class/power_supply/BAT*/energy_now | paste -sd+ | bc)
full=$(cat /sys/class/power_supply/BAT*/energy_full | paste -sd+ | bc)
designfull=$(cat /sys/class/power_supply/BAT*/energy_full_design | paste -sd+ | bc)
AC=$(cat /sys/class/power_supply/AC/online)
percentage=$(echo "x=$energy/$full*100; scale=0; x/1" | bc -l)
life=$(echo "x=$full/$designfull*100; scale=0; x/1" | bc -l)
if [ $AC == 1 ]
then
  time=$(echo "($full-$energy)/$power*60*60 + 5*60*60" | bc -l)
  icons=(         )
else 
  time=$(echo "$energy/$power*60*60 + 5*60*60" | bc -l)
  icons=(          )
fi 
time=$(echo $(date -d "@$time") | awk '{print $5 }')
time=$(echo $time | sed 's/:..$//g' | sed 's/00:00//g')
step=$(echo "x=$percentage/100*(${#icons[@]}-2); scale=0; x/1" | bc -l)
if [ $percentage == 100 ]
then
  step=$(echo "$step + 1" | bc)
fi

#echo ${icons[step]} $percentage% $time $life%
echo ${icons[step]} $percentage% $time
