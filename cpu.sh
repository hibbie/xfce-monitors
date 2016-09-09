#!/bin/bash
CPU=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{print ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

if [ $(echo $CPU'<25' | bc) == 1 ]; then 
    echo " "
else
    if [ $(echo $CPU'<35' | bc) == 1 ]; then
       echo "<txt><span font='10' fgcolor='#eee'>system health: </span><span weight='Bold' fgcolor='Yellow' font='9.2' letter_spacing='2000'>cpu </span> </txt>"
    else
       echo "<txt><span font='10' fgcolor='#eee'>system health: </span><span weight='Bold' fgcolor='Red' bgcolor='Yellow' font='9.2' letter_spacing='2000'> cpu </span> </txt>"
   fi
fi

