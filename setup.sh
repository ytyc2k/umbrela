sudo ln -fs /usr/share/zoneinfo/Canada/Central /etc/localtime

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y build-essential redis-server mongodb nginx python git

curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get -y install nodejs

cd
git clone https://github.com/ytyc2k/umbrela.git
git clone https://github.com/openhab/openhab-cloud.git

cd openhab-cloud

cp ~/umbrela/config.json ./config.json
cp ~/umbrela/user.js ./models/user.js
cp ~/umbrela/mailer.js ./mailer.js

npm install
npm update
npm install bcrypt time

# SSL
sudo service nginx stop
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install -y certbot python-certbot-nginx
sudo certbot --nginx -d myopenhab.umbrela.co -m smartsnsz@gmail.com -n --agree-tos

sudo cp ~/umbrela/default /etc/nginx/sites-available/default
grep -q "sudo /usr/bin/node /home/ubuntu/openhab-cloud/app.js" /etc/rc.local 
if [[ $? != 0 ]]; then
  sudo sed -i '$i sudo \/usr\/bin\/node \/home\/ubuntu\/openhab-cloud\/app.js' /etc/rc.local 
fi

cd ~/openhab-cloud

sudo nohup node app.js &
sudo service nginx restart


# $ sudo crontab -l
# * 7,19 * * * certbot -q renew

# show in browser https://myopenhab.umbrela.co
