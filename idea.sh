apt update
apt install openjdk-14-jdk wget
mkdir /usr/share/idea
wget https://download-cf.jetbrains.com/idea/ideaIC-2020.3.2.tar.gz -P /usr/share/idea
tar -xvf /usr/share/idea/ideaIC-2020.3.2.tar.gz
rm /usr/share/idea/ideaIC-2020.3.2.tar.gz
mv /usr/share/idea/Idea-IC-*/* /usr/share/idea
rm -rf /usr/share/idea/Idea-IC-*
if [ ! -f /usr/bin/idea ]; then echo "bash /usr/share/idea/bin/idea.sh" > /usr/bin/idea; fi
chmod +x /usr/bin/idea
