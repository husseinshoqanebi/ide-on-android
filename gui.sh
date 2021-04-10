apt update
apt install curl -y
https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/vncpasswd | bash
apt install kali-desktop-xfce dbus-x11 tigervnc-standalone-server -y
apt clean

#fix pulseaudio
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/pulseaudio-autostart.sh | bash > /dev/null 2>&1

#set default password for vnc
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/vncpasswd | cat > ~/.vnc/passwd

#create gui-start command
echo "vncserver -kill :1" > /usr/bin/gui-start
echo "rm -rf /tmp/.X1-lock" >> /usr/bin/gui-start
echo "rm -rf /tmp/.X11-unix/X1" >> /usr/bin/gui-start
echo "rm -rf ~/.vnc/localhost:1.pid" >> /usr/bin/gui-start
echo "vncserver" >> /usr/bin/gui-start
chmod +x /usr/bin/gui-start ;

#create gui-stop command
echo "vncserver -kill :1" > /usr/bin/gui-stop
echo "rm -rf /tmp/.X1-lock" >> /usr/bin/gui-stop
echo "rm -rf /tmp/.X11-unix/X1" >> /usr/bin/gui-stop
echo "rm -rf ~/.vnc/localhost:1.pid" >> /usr/bin/gui-stop
chmod +x /usr/bin/gui-start ;

#export view
echo "export DISPLAY=":1"" >> /etc/bash.bashrc
