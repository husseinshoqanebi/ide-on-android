apt update
apt install kali-desktop-xfce dbus-x11 tigervnc-standalone-server -y 
if [ ! -f /usr/bin/gui-start ]; then echo "if [ -f ~/.vnc/localhost:1.pid ]; then vncserver -kill :1 && vncserver; else vncserver; fi" > /usr/bin/gui-start && chmod +x /usr/bin/gui-start ; fi && if [ ! -f /usr/bin/gui-stop ]; then echo "if [ -f ~/.vnc/localhost:1.pid ]; then vncserver -kill :1; fi" > /usr/bin/gui-stop && chmod +x /usr/bin/gui-stop ; fi && echo "export DISPLAY=":1"" >> .bashrc
vncpasswd
