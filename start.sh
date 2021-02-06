#!/data/data/com.termux/files/usr/bin/bash
cd $(dirname $0)
unset LD_PRELOAD
command="proot"
command+=" --kernel-release=5.10.0"
command+=" --link2symlink"
command+=" --kill-on-exit"
command+=" --root-id
command+=" -r kali-fs"
command+=" -b /dev"
command+=" -b /dev/urandom:/dev/random"
command+=" -b /proc/self/fd/0:/dev/stdin"
command+=" -b /proc/self/fd/1:/dev/stdout"
command+=" -b /proc/self/fd/2:/dev/stderr"
command+=" -b /proc/self/fd"
command+=" -b /sys"
command+=" -b /proc"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/version:/proc/version"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/loadavg:/proc/loadavg"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/stat:/proc/stat"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/uptime:/proc/uptime" 
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/vmstat:/proc/vmstat"
command+=" -b kali-fs/root:/dev/shm"
command+=" -b /sdcard"
command+=" -b /storage"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" TMPDIR=/tmp"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
if [ -z "$1" ];then
    exec $command
else
    $command -c "$com"
fi
