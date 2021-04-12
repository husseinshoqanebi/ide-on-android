version="2021.1"
apt update
apt install build-essential default-jdk wget
apt clean
rm -rf /usr/share/clion
mkdir /usr/share/clion
wget https://download.jetbrains.com/cpp/CLion-${version}.tar.gz -P /usr/share/clion
tar -xvf /usr/share/clion/CLion-${version}.tar.gz -C /usr/share/clion
rm -rf /usr/share/Clion-${version}.tar.gz
mv -rf /usr/share/clion/clion-${version}/* /usr/share/clion
rm -rf /usr/share/clion/clion-${version}
echo "bash /usr/share/clion/bin/clion.sh" > /usr/bin/clion
chmod +x /usr/bin/clion

#create desktop icon
echo "[Desktop Entry]" > /root/Desktop/Clion.desktop
echo "Version=${version}" >> /root/Desktop/Clion.desktop
echo "Type=Application" >> /root/Desktop/Clion.desktop
echo "Name=clion" >> /root/Desktop/Clion.desktop
echo "Comment=Clion is an integrated development environment (IDE) used in computer programming, specifically for the C++ language." >> /root/Desktop/Clion.desktop
echo "Exec=/usr/bin/clion" >> /root/Desktop/Clion.desktop
echo "Icon=/usr/share/clion/bin/clion.svg" >> /root/Desktop/Clion.desktop
echo "Path=/root" >> /root/Desktop/Clion.desktop
echo "Terminal=false" >> /root/Desktop/Clion.desktop
echo "StartupNotify=false" >> /root/Desktop/Clion.desktop

#edit settings 32bit
echo -e "-server" > /usr/share/clion/bin/clion.vmoptions
echo -e "-Xms128m" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Xmx400m" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:ReservedCodeCacheSize=384m" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:+UseConcMarkSweepGC" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:SoftRefLRUPolicyMSPerMB=50" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:CICompilerCount=2" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:+HeapDumpOnOutOfMemoryError" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-XX:-OmitStackTraceInFastThrow" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-ea" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Dsun.io.useCanonCaches=false" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Djdk.http.auth.tunneling.disabledSchemes=\"\"" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Djdk.attach.allowAttachSelf=true" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Djdk.module.illegalAccess.silent=true" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Dkotlinx.coroutines.debug=off" >> /usr/share/clion/bin/clion.vmoptions
echo -e "-Dsun.tools.attach.tmp.only=true" >> /usr/share/clion/bin/clion.vmoptions

#edit settings 64bit
echo -e "-server" > /usr/share/clion/bin/clion64.vmoptions
echo -e "-Xms128m" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Xmx400m" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:ReservedCodeCacheSize=384m" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:+UseConcMarkSweepGC" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:SoftRefLRUPolicyMSPerMB=50" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:CICompilerCount=2" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:+HeapDumpOnOutOfMemoryError" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-XX:-OmitStackTraceInFastThrow" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-ea" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Dsun.io.useCanonCaches=false" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Djdk.http.auth.tunneling.disabledSchemes=\"\"" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Djdk.attach.allowAttachSelf=true" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Djdk.module.illegalAccess.silent=true" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Dkotlinx.coroutines.debug=off" >> /usr/share/clion/bin/clion64.vmoptions
echo -e "-Dsun.tools.attach.tmp.only=true" >> /usr/share/clion/bin/clion64.vmoptions
