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
if [ -d ~/kali-binds ]; then rm -rf ~/kali-binds; fi
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/linux-${archurl}.tar.xz -P ~
mkdir ~/kali-fs && mkdir ~/kali-binds 
tar -xvf ~/linux-${archurl}.tar.xz -C ~/kali-fs || : 
rm ~/linux-${archurl}.tar.xz
if [ -f ~/start.sh ]; then rm -rf ~/start.sh; fi
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/start.sh
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > ~/kali-fs/etc/apt/sources.list
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/loadavg && mv loadavg ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/stat && mv stat ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/uptime && mv uptime ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/vmstat && mv vmstat ./kali-fs/proc/
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/proc/version && mv version ./kali-fs/proc/
termux-setup-storage 
if [ -d .termux ]; then rm -rf .termux && mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux;else mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/termux.properties && mv termux.properties .termux; fi
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-on-android/main/bashrc -P ~ && mv ~/bashrc ~/.bashrc && source ~/.bashrc
