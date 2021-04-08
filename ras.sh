echo "deb http://apt.adafruit.com/raspbian/ jessie main" | sudo tee --append /etc/apt/sources.list
wget -O - -q https://apt.adafruit.com/apt.adafruit.com.gpg.key | sudo apt-key add -
apt-get update
