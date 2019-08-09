percentage=$(acpi | awk '{print $4}' | grep -o '[0-9]\+' | paste -sd+ | bc)
if [ $(acpi | awk '{print $3}' | grep Charging) ]
then
  icons=(      )
else 
  icons=(          )
fi 
step=$(echo "x=$percentage/200*(${#icons[@]}-1); scale=0; x/1" | bc -l)
echo ${icons[step]} $percentage
