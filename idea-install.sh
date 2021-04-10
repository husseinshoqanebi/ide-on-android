version="2021.1"

#install قequirements
apt update
apt install default-jdk wget
apt clean

#download the program
rm -rf /usr/share/idea
mkdir /usr/share/idea
wget https://download-cf.jetbrains.com/idea/ideaIC-${version}.tar.gz -P /usr/share/idea
tar -xvf /usr/share/idea/ideaIC-${version}.tar.gz -C /usr/share/idea
rm /usr/share/idea/ideaIC-${version}.tar.gz
mv /usr/share/idea/idea-IC-*/* /usr/share/idea
rm -rf /usr/share/idea/idea-IC-*
echo "bash /usr/share/idea/bin/idea.sh" > /usr/bin/idea
chmod +x /usr/bin/idea

#create desktop icon
echo "[Desktop Entry]" > /root/Desktop/IntelliJ-IDEA.desktop
echo "Version=${version}" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "Type=Application" >> /root/IntelliJ-IDEA.desktop
echo "Name=IntelliJ-IDEA" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "Comment=IintelliJ IDEA is an integrated development environment (IDE) written in Java for developing computer software" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "Exec=/usr/bin/idea" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "Icon=/usr/share/idea/bin/idea.svg" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "Path=/root" >> /root/IntelliJ-IDEA.desktop
echo "Terminal=false" >> /root/Desktop/IntelliJ-IDEA.desktop
echo "StartupNotify=false" >> /root/Desktop/IntelliJ-IDEA.desktop

#edit settings
echo -e "-server" > /usr/share/idea/bin/idea.vmoptions
echo -e "-Xms128m" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Xmx400m" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:ReservedCodeCacheSize=384m" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:+UseConcMarkSweepGC" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:SoftRefLRUPolicyMSPerMB=50" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:CICompilerCount=2" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:+HeapDumpOnOutOfMemoryError" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-XX:-OmitStackTraceInFastThrow" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-ea" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Dsun.io.useCanonCaches=false" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Djdk.http.auth.tunneling.disabledSchemes=\"\"" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Djdk.attach.allowAttachSelf=true" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Djdk.module.illegalAccess.silent=true" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Dkotlinx.coroutines.debug=off" >> /usr/share/idea/bin/idea.vmoptions
echo -e "-Dsun.tools.attach.tmp.only=true" >> /usr/share/idea/bin/idea.vmoptions
