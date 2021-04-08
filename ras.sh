#echo "deb http://archive.raspbian.org/raspbian wheezy main contrib non-free" > /etc/apt/sources.list.d/raspbian.list
#echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free" >> /etc/apt/sources.list.d/raspbian.list
#wget https://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -
#apt-get update
#curl https://raw.githubusercontent.com/futurejones/code-oss-aarch64/master/debian_stretch_armv7/vs-stretch-build.sh | bash
wget -O code-oss_armhf.deb --content-disposition https://packagecloud.io/headmelted/codebuilds/packages/ubuntu/xenial/code-oss_1.28.0-1537780162_armhf.deb/download.deb
sudo dpkg -i code-oss_armhf.deb
sudo apt install -f
rm -f code-oss_armhf.deb
sudo ln -sf /usr/bin/code-oss /usr/bin/code
#suit for sync extension
sudo mkdir -p /usr/share/code/bin
sudo ln -sf /usr/share/code-oss/bin/code-oss /usr/share/code/bin/code
