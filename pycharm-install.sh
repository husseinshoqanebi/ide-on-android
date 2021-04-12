version="2020.3.3"
apt update
apt install python3 default-jdk wget
apt clean
rm -rf /usr/bin/pycharm
mkdir /usr/bin/pycharm
wget https://download-cf.jetbrains.com/python/pycharm-community-${version}.tar.gz -P /usr/share/pycharm
tar -xvf /usr/share/pycharm/pycharm-community-${version}.tar.gz -C /usr/share/pycharm
rm -rf /usr/share/pycharm/pycharm-community-${version}.tar.gz
mv -rf /usr/share/pycharm/pycharm-community-${version}/* /usr/share/pycharm
rm -rf /usr/share/pycharm/pycharm-community-${version}
echo "bash /usr/share/pycharm/bin/pycharm.sh" > /usr/bin/pycharm
chmod +x /usr/bin/pycharm

#create desktop icon
echo "[Desktop Entry]" > /root/Desktop/Pycharm.desktop
echo "Version=${version}" >> /root/Desktop/Pycharm.desktop
echo "Type=Application" >> /root//Desktop/Pycharm.desktop
echo "Name=Pycharm" >> /root//Desktop/Pycharm.desktop
echo "Comment=PyCharm is an integrated development environment (IDE) used in computer programming, specifically for the Python language." >> /root//Desktop/Pycharm.desktop
echo "Exec=/usr/bin/pycharm" >> /root//Desktop/Pycharm.desktop
echo "Icon=/usr/share/pycharm/bin/pycharm.svg" >> /root//Desktop/Pycharm.desktop
echo "Path=/root" >> /root//Desktop/Pycharm.desktop
echo "Terminal=false" >> /root//Desktop/Pycharm.desktop
echo "StartupNotify=false" >> /root//Desktop/Pycharm.desktop

#edit settings 32bit
echo -e "-server" > /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Xms128m" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Xmx400m" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:ReservedCodeCacheSize=384m" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:+UseConcMarkSweepGC" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:SoftRefLRUPolicyMSPerMB=50" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:CICompilerCount=2" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:+HeapDumpOnOutOfMemoryError" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-XX:-OmitStackTraceInFastThrow" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-ea" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Dsun.io.useCanonCaches=false" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Djdk.http.auth.tunneling.disabledSchemes=\"\"" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Djdk.attach.allowAttachSelf=true" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Djdk.module.illegalAccess.silent=true" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Dkotlinx.coroutines.debug=off" >> /usr/share/pycharm/bin/pycharm.vmoptions
echo -e "-Dsun.tools.attach.tmp.only=true" >> /usr/share/pycharm/bin/pycharm.vmoptions

#edit settings 64bit
echo -e "-server" > /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Xms128m" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Xmx400m" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:ReservedCodeCacheSize=384m" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:+UseConcMarkSweepGC" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:SoftRefLRUPolicyMSPerMB=50" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:CICompilerCount=2" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:+HeapDumpOnOutOfMemoryError" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-XX:-OmitStackTraceInFastThrow" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-ea" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Dsun.io.useCanonCaches=false" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Djdk.http.auth.tunneling.disabledSchemes=\"\"" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Djdk.attach.allowAttachSelf=true" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Djdk.module.illegalAccess.silent=true" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Dkotlinx.coroutines.debug=off" >> /usr/share/pycharm/bin/pycharm64.vmoptions
echo -e "-Dsun.tools.attach.tmp.only=true" >> /usr/share/pycharm/bin/pycharm64.vmoptions
