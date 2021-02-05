apt update && apt install wget openssl-tool proot -y
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/linux-armhf.tar.xz
mkdir ~/kali-fs && mkdir ~/kali-binds 
tar -xvf ~/linux-armhf.tar.xz -C ~/kali-fs || : 
rm ~/linux-armhf.tar.xz
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/start.sh
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > ~/kali-fs/etc/apt/sources.list
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/cmdline && mv cmdline ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/cpuinfo && mv cpuinfo ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/mounts && mv mounts ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/version && mv version ./kali-fs/proc/
termux-setup-storage 
if [ -d .termux ]; then rm -rf .termux && mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux;else mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux; fi
echo "clear && termux-wake-lock && bash ~/start.sh && exit" > ~/.bashrc && source ~/.bashrc
