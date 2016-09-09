#!/bin/bash
VRMT=$(sensors | grep '(high = +85.0°C, hyst = +77.0°C)' | awk -v RS="" '{print ($13-$2)}' | sed -e 's/[^0-9]//g')
VRML='vrm'
if [ $(echo $VRMT'<80' | bc) == 1 ]; then
    echo "<txt><span font='10' fgcolor='#fff'>$VRML: </span><span weight='Bold' fgcolor='#00B000' font='9.2' letter_spacing='2000' >$VRMT°</span> </txt>"
else
    if [ $(echo $VRMT'<95' | bc) == 1 ]; then
       echo "<txt><span font='10' fgcolor='#fff'>$VRML: </span><span weight='Bold'  font='9.2' fgcolor='Yellow'>$VRMT°</span> </txt>"
    else
       echo "<txt><span font='10' fgcolor='#fff'>$VRML: </span><span weight='Bold'  font='9.2' bgcolor='Yellow'fgcolor='Red'> $VRMT° </span> </txt>"
   fi
fi

