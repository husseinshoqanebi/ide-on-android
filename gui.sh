apt update
apt install curl -y
https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/vncpasswd | bash
apt install kali-desktop-xfce dbus-x11 tigervnc-standalone-server -y
apt clean
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/pulseaudio-autostart.sh | bash > /dev/null 2>&1
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/vncpasswd | cat > ~/.vnc/passwd
if [ ! -f /usr/bin/gui-start ]; then
  echo "vncserver -kill :1 && rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1 ~/.vnc/localhost:1.pid && vncserver" > /usr/bin/gui-start && chmod +x /usr/bin/gui-start ;
fi
if [ ! -f /usr/bin/gui-stop ]; then
  echo "vncserver -kill :1 && rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1 ~/.vnc/localhost:1.pid" > /usr/bin/gui-stop && chmod +x /usr/bin/gui-stop ;
fi
echo "export DISPLAY=":1"" >> /etc/bash.bashrc
