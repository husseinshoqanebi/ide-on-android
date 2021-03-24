apt update && apt install wget openssl-tool proot -y
case `dpkg --print-architecture` in
	aarch64)
		archurl="arm64" ;;
	arm)
		archurl="armhf" ;;
	amd64)
		archurl="amd64" ;;
	x86_64)
		archurl="amd64" ;;	
	i*86)
		archurl="i386" ;;
    x86)
		archurl="i386" ;;
	*)
		echo "unknown architecture"; exit 1 ;;
	esac
if [ -f ~/linux-${archurl}.tar.xz ]; then rm -rf ~/linux-${archurl}.tar.xz; fi
if [ -d ~/kali-fs ]; then rm -rf ~/kali-fs; fi
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/linux-${archurl}.tar.xz -P ~
mkdir ~/kali-fs && mkdir ~/kali-binds 
echo -e "\e[32mdecompressing the system file...\e[37m"
proot --link2symlink tar -xf ~/linux-${archurl}.tar.xz -C ~/kali-fs || : 
rm ~/linux-${archurl}.tar.xz
if [ -f ~/start.sh ]; then rm -rf ~/start.sh; fi
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/start.sh -P ~ && chmod +x ~/start.sh
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > ~/kali-fs/etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> ~/kali-fs/etc/apt/sources.list
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/loadavg && mv loadavg ~/kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/stat && mv stat ~/kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/uptime && mv uptime ~/kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/vmstat && mv vmstat ~/kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/version && mv version ~/kali-fs/proc/
termux-setup-storage 
if [ -d .termux ]; then rm -rf .termux && mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux;else mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux; fi
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/bashrc | cat > /data/data/com.termux/files/usr/etc/bash.bashrc
source /data/data/com.termux/files/usr/etc/bash.bashrc
