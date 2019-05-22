sudo ln -fs /usr/share/zoneinfo/Canada/Central /etc/localtime

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y build-essential redis-server mongodb nginx python git

curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get -y install nodejs

cd
git clone https://github.com/openhab/openhab-cloud.git

cd openhab-cloud

cp ~/config.json ./config.json
cp ~/user.js ./models/user.js
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
# smartsnsz@gmail.com
# (A)gree/(C)ancel: A
# (Y)es/(N)o: N
# myopenhab.umbrela.co
# Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2

sudo cp ~/default /etc/nginx/sites-available/default
cd ~/openhab-cloud
sudo node app.js
sudo service nginx restart

# automatic run , add the following line in /etc/rc.local
# sudo /usr/bin/node /home/ubuntu/openhab-cloud/app.js

# $ sudo crontab -l
# * 7,19 * * * certbot -q renew

# fix "forgot password" by Email change
# change mailer.js 
# before:
# productionEnv = process.env.NODE_ENV || 'dev';
# after:
# productionEnv = process.env.NODE_ENV || 'production';

# show in browser https://myopenhab.umbrela.co
