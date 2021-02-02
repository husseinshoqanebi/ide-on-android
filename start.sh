#!/data/data/com.termux/files/usr/bin/bash
cd $(dirname $0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r kali-fs"
if [ -n "$(ls -A kali-binds)" ]; then
    for f in kali-binds/* ;do
      . $f
    done
fi

command+=" -b /dev"
command+=" -b /proc/self/fd/0:/dev/stdin"
command+=" -b /proc/self/fd/1:/dev/stdout"
command+=" -b /proc/self/fd/2:/dev/stderr"
command+=" -b /proc/self/fd"
command+=" -b /sys"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/cmdline:/proc/cmdline"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/version:/proc/version"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/cpuinfo:/proc/cpuinfo"
command+=" -b /data/data/com.termux/files/home/kali-fs/proc/mounts:/proc/mounts"
command+=" -b kali-fs/root:/dev/shm"
command+=" -b /sdcard"
command+=" -b /storage"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
if [ -z "$1" ];then
    exec $command
else
    $command -c "$com"
fi
