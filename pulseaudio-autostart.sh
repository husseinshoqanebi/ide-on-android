#!/usr/bin/bash
file=/usr/local/bin/pulseaudio.sh; [ -e $file ] && cp -n $file{,.bkup}
echo -e  '#!/bin/bash\ntimeout 10 pulseaudio -D\nsleep 15\nexit 0;'> $file
chmod 0500 $file
mkdir -p /root/.config/autostart/
file=/root/.config/autostart/pulseaudioscript.sh.desktop; [ -e $file ] && cp -n $file{,.bkup}
echo -e '\n[Desktop Entry]\nType=Application\nExec=/usr/local/bin/pulseaudio.sh\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=pulseaudio\nName=pulseaudio\nComment[en_US]=\nComment=' > $file
      sleep 5;
exit 0;
