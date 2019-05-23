sudo chmod 777 /var/spool/cron/crontabs/root
sudo grep -q "certbot -q renew" /var/spool/cron/crontabs/root
if [[ $? != 0 ]]; then
  sudo echo "* 7,19 * * * certbot -q renew" >> /var/spool/cron/crontabs/root
fi
sudo chmod 600 /var/spool/cron/crontabs/root
