if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
    command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
    }
fi

PS1='\$ '

clear
termux-wake-lock
echo -e "\u001b[32m"
echo -e "############################"
echo -e "#      IDE On Android      #"
echo -e "#       Version: 1.0       #"
echo -e "#     by: Hussein Faleh    #"
echo -e "############################"
echo -e "\u001b[39m"
bash ~/start.sh
exit
