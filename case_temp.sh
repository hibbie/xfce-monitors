#!/bin/bash
CASET=$(sensors | grep '(high = +70.0°C, hyst = +68.0°C)' | awk -v RS="" '{print ($13-$2)}' | sed -e 's/[^0-9]//g')
CASEL='env'
if [ $(echo $CASET'<50' | bc) == 1 ]; then
    echo "<txt><span font='10' fgcolor='#fff'>$CASEL: </span><span weight='Bold' fgcolor='#00B000' font='9.2' letter_spacing='2000' >$CASET°</span> </txt>"
else
    if [ $(echo $CASET'<60' | bc) == 1 ]; then
       echo "<txt><span font='10' fgcolor='#fff'>$CASEL: </span><span weight='Bold' font='9.2' fgcolor='Yellow'>$CASET°</span> </txt>"
    else
       echo "<txt><span font='10' fgcolor='#fff'>$CASEL: </span><span weight='Bold' font='9.2' fgcolor='Red' bgcolor='Yellow'> $CASET° </span> </txt>"
   fi
fi

