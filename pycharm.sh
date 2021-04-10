version="2020.3.3"
apt update
apt install python3 default-jdk wget
apt clean
rm -rf /usr/bin/pycharm
mkdir /usr/bin/pycharm
wget https://download-cf.jetbrains.com/python/pycharm-community-${version}.tar.gz -P /usr/share/pycharm
tar -xvf /usr/share/pycharm/pycharm-community-${version}.tar.gz -C /usr/share/pycharm
rm -rf /usr/share/pycharm/pycharm-community-${version}.tar.gz
mv -rf /usr/share/pycharm/pycharm-community-2020.3.3/* /usr/share/pycharm
rm -rf /usr/share/pycharm/pycharm-community-${version}
echo "bash /usr/share/pycharm/bin/pycharm.sh" > /usr/bin/pycharm
chmod +x /usr/bin/pycharm
