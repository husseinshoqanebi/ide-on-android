apt update
apt install curl kali-desktop-xfce dbus-x11 tigervnc-standalone-server -y
apt clean
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/pulseaudio-autostart.sh | bash > /dev/null 2>&1
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/vncpasswd | cat > ~/.vnc/passwd
if [ ! -f /usr/bin/gui-start ]; then echo "if [ -f ~/.vnc/localhost:1.pid ]; then vncserver -kill :1 && vncserver; else vncserver; fi" > /usr/bin/gui-start && chmod +x /usr/bin/gui-start ; fi && if [ ! -f /usr/bin/gui-stop ]; then echo "if [ -f ~/.vnc/localhost:1.pid ]; then vncserver -kill :1; fi" > /usr/bin/gui-stop && chmod +x /usr/bin/gui-stop ; fi && echo "export DISPLAY=":1"" >> .bashrc
