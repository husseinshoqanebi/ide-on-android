version="2020.3.3"
apt update
apt install python3 default-jdk wget
apt clean
if [ -d /usr/bin/pycharm ]; then rm -f /usr/bin/pycharm && mkdir /usr/bin/pycharm; fi
wget https://download-cf.jetbrains.com/python/pycharm-community-${version}.tar.gz -P /usr/share/pycharm
tar -xvf /usr/share/pycharm/pycharm-community-${version}.tar.gz -C /usr/share/pycharm
rm /usr/share/pycharm/pycharm-community-${version}.tar.gz
mv /usr/share/pycharm/pycharm-community-2020.3.3/* /usr/share/pycharm
rm -rf /usr/share/pycharm/pycharm-community-${version}
if [ ! -f /usr/bin/pycharm ]; then echo "bash /usr/share/pycharm/bin/pycharm.sh" > /usr/bin/pycharm; fi
chmod +x /usr/bin/pycharm
