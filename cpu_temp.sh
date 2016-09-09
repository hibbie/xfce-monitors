#!/bin/bash
CPUT=$(sensors | grep '(high = +85.0°C, hyst = +81.0°C)' | awk -v RS="" '{print ($13-$2)}' | sed -e 's/[^0-9]//g')
CPUL='cpu'
if [ $(echo $CPUT'<60' | bc) == 1 ]; then
    echo "<txt><span font='10' fgcolor='#fff'>$CPUL: </span><span weight='Bold' fgcolor='#00B000' font='9.2' letter_spacing='2000' >$CPUT°</span> </txt>"
else
    if [ $(echo $CPUT'<65' | bc) == 1 ]; then
       echo "<txt><span font='10' fgcolor='#fff'>$CPUL: </span><span weight='Bold' font='9.2' fgcolor='Yellow'>$CPUT°</span> </txt>"
    else
       echo "<txt><span font='10' fgcolor='#fff'>$CPUL: </span><span weight='Bold' font='9.2' fgcolor='Red' bgcolor='Yellow'> $CPUT° </span> </txt>"
   fi
fi

