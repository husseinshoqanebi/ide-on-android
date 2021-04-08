#echo "deb http://archive.raspbian.org/raspbian wheezy main contrib non-free" > /etc/apt/sources.list.d/raspbian.list
#echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free" >> /etc/apt/sources.list.d/raspbian.list
#wget https://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -
#apt-get update
curl https://raw.githubusercontent.com/futurejones/code-oss-aarch64/master/debian_stretch_armv7/vs-stretch-build.sh | bash
