#!/data/data/com.termux/files/usr/bin/bash
repo="ide-for-android"
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
rm -rf ~/linux-${archurl}.tar.xz
rm -rf ~/kali-fs
wget https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/linux-${archurl}.tar.xz -P ~
mkdir ~/kali-fs && mkdir ~/kali-binds 
echo -e "\e[32mdecompressing the system file\e[37m"
proot --link2symlink tar -xf ~/linux-${archurl}.tar.xz -C ~/kali-fs || :
rm ~/linux-${archurl}.tar.xz
rm -rf ~/start.sh
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/start.sh | cat > ~/start.sh && chmod +x ~/start.sh

#add kali and debian repos
echo "deb [trasted=yes] http://http.kali.org/kali kali-rolling main non-free contrib" > ~/kali-fs/etc/apt/sources.list
echo "deb-src [trasted=yes] http://http.kali.org/kali kali-rolling main non-free contrib" >> ~/kali-fs/etc/apt/sources.list
echo "deb [trasted=yes] http://httpredir.debian.org/debian jessie main" > ~/kali-fs/etc/apt/sources.list.d/debian.list
echo "deb [trasted=yes] http://httpredir.debian.org/debian stretch main" >> ~/kali-fs/etc/apt/sources.list.d/debian.list

#fix processes problem
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/proc/loadavg | cat > ~/kali-fs/proc/loadavg
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/proc/stat | cat > ~/kali-fs/proc/stat
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/proc/uptime | cat > ~/kali-fs/proc/uptime
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/proc/vmstat | cat > ~/kali-fs/proc/vmstat
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/proc/version | cat > ~/kali-fs/proc/version

#change root default password
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/shadow | cat > ~/kali-fs/etc/shadow

#color the bash and add importent stuffes
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/bash.bashrc | cat > ~/kali-fs/etc/bash.bashrc

#give permission to termux to access storage
termux-setup-storage

#edit termux keyborad
rm -rf .termux
mkdir .termux
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/termux.properties > ~/.termux/termux.properties
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/bashrc | cat > /data/data/com.termux/files/usr/etc/bash.bashrc

#edit sign key of apt
cd $(dirname $0)
unset LD_PRELOAD
curl https://raw.githubusercontent.com/husseinshoqanebi/${repo}/main/archive-key.asc | cat > ~/kali-fs/root/archive-key.asc
proot --kernel-release=5.10.0 --link2symlink --kill-on-exit --root-id -r kali-fs -b /dev -b /sys -b /proc -b kali-fs/root:/dev/shm -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM TMPDIR=/tmp LANG=C.UTF-8 /bin/apt-key add archive-key.asc >/dev/null 2>&1
rm /data/data/com.termux/files/home/kali-fs/root/archive-key.asc

#remove termux init message
rm /data/data/com.termux/files/usr/etc/motd

#start
exec bash
bash ~/start.sh && pkill -9 bash
