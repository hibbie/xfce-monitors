#!/bin/bash
IP=$(curl icanhazip.com)
if [[ ${IP:0:3} == "162" ]] ; then 
    echo "<txt><span font='10' fgcolor='#fff'>vpn: </span><span weight='Bold' fgcolor='#00B000' font='10' >active</span></txt>"; 
else 
    echo "<txt><span font='10' fgcolor='#fff'>vpn: </span><span weight='Bold' fgcolor='Red' font='9.2'>$IP</span></txt>"; 
fi
