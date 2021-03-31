#!/data/data/com.termux/files/usr/bin/bash
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
wget https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/linux-${archurl}.tar.xz -P ~
mkdir ~/kali-fs && mkdir ~/kali-binds 
echo -e "\e[32mdecompressing the system file...\e[37m"
proot --link2symlink tar -xf ~/linux-${archurl}.tar.xz -C ~/kali-fs || :
rm ~/linux-${archurl}.tar.xz
if [ -f ~/start.sh ]; then rm -rf ~/start.sh; fi
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/start.sh | cat > ~/start.sh && chmod +x ~/start.sh
echo "deb [trasted=yes] http://http.kali.org/kali kali-rolling main non-free contrib" > ~/kali-fs/etc/apt/sources.list
echo "deb-src [trasted=yes] http://http.kali.org/kali kali-rolling main non-free contrib" >> ~/kali-fs/etc/apt/sources.list
echo "deb [trasted=yes] http://httpredir.debian.org/debian jessie main" > ~/kali-fs/etc/apt/sources.list.d/debian.list
echo "deb [trasted=yes] http://httpredir.debian.org/debian stretch main" >> ~/kali-fs/etc/apt/sources.list.d/debian.list
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/proc/loadavg | cat > ~/kali-fs/proc/loadavg
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/proc/stat | cat > ~/kali-fs/proc/stat
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/proc/uptime | cat > ~/kali-fs/proc/uptime
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/proc/vmstat | cat > ~/kali-fs/proc/vmstat
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/proc/version | cat > ~/kali-fs/proc/version
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/shadow | cat > ~/kali-fs/etc/shadow
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/bash.bashrc | cat > ~/kali-fs/etc/bash.bashrc
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/archive-key.asc | cat > ~/kali-fs/root/archive-key.asc
termux-setup-storage
if [ -d .termux ]; then rm -rf .termux && mkdir .termux && cur https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/termux.properties && mv termux.properties .termux;else mkdir .termux && wget https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/termux.properties | cat > .termux/termux.propereties; fi
curl https://raw.githubusercontent.com/husseinshoqanebi/ide-for-android/main/bashrc | cat > /data/data/com.termux/files/usr/etc/bash.bashrc
## edit sign key of apt
cd $(dirname $0)
unset LD_PRELOAD
proot --kernel-release=5.10.0 --link2symlink --kill-on-exit --root-id -r kali-fs -b /dev -b /sys -b /proc -b kali-fs/root:/dev/shm -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM TMPDIR=/tmp LANG=C.UTF-8 /bin/apt-key add archive-key.asc >/dev/null 2>&1
rm /data/data/com.termux/files/usr/etc/motd
rm /data/data/com.termux/files/home/kali-fs/root/archive-key.asc
exec bash
