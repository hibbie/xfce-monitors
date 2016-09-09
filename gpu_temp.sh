#!/bin/bash
GPUT=$(sensors | grep '(crit =  +0.0°C, hyst =  +0.0°C)' | awk -v RS="" '{print ($13-$2)}' | sed -e 's/[^0-9]//g')
GPUL='gpu'
if [ $(echo $GPUT'<65' | bc) == 1 ]; then
    echo "<txt><span font='10' fgcolor='#fff'>$GPUL: </span><span weight='Bold' fgcolor='#00B000' font='9.2' letter_spacing='2000' >$GPUT°</span> </txt>"
else
    if [ $(echo $GPUT'<70' | bc) == 1 ]; then
       echo "<txt><span font='10' fgcolor='#fff'>$GPUL: </span><span weight='Bold' font='9.2'  fgcolor='Yellow'>$GPUT°</span> </txt>"
    else
       echo "<txt><span font='10' fgcolor='#fff'>$GPUL: </span><span weight='Bold' font='9.2' fgcolor='Red' bgcolor='Yellow'> $GPUT° </span> </txt>"
   fi
fi

