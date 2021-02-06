apt update
apt install default-jdk wget
if [ -d /usr/bin/idea ]; then rm -f /usr/bin/idea && mkdir /usr/bin/idea; fi
wget https://download-cf.jetbrains.com/idea/ideaIC-2020.3.2.tar.gz -P /usr/share/idea
tar -xvf /usr/share/idea/ideaIC-2020.3.2.tar.gz -C /usr/bin/idea
rm /usr/share/idea/ideaIC-2020.3.2.tar.gz
mv /usr/share/idea/idea-IC-*/* /usr/share/idea
rm -rf /usr/share/idea/idea-IC-*
if [ ! -f /usr/bin/idea ]; then echo "bash /usr/share/idea/bin/idea.sh" > /usr/bin/idea; fi
chmod +x /usr/bin/idea
