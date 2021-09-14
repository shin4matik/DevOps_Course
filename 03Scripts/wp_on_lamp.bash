#!/usr/bin/bash
clear
echo "============================================"
echo "WordPress Install Script"
echo "============================================"
echo "Database Name: "
read -e dbname
echo "Database User: "
read -e dbuser
echo "Database Password: "
read -s dbpass
echo "run install? (y/n)"
read -e run
if [ "$run" == n ] ; then
exit
else
echo "============================================"
echo "A robot is now installing WordPress for you."
echo "============================================"
#download wordpress
curl -O https://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf . ..
#move back to parent dir
cd ..
#remove files from wordpress folder
rm -R wordpress
#create wp config
cp wp-config-sample.php wp-config.php
#set database details with perl find and replace
perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
perl -pi -e "s/username_here/$dbuser/g" wp-config.php
perl -pi -e "s/password_here/$dbpass/g" wp-config.php

#set WP salts
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php

#create uploads folder and set permissions
mkdir wp-content/uploads
chmod 775 wp-content/uploads
echo "Cleaning..."
#remove zip file
rm latest.tar.gz
#remove bash script
rm wp.sh
echo "========================="
echo "Installation is complete."
echo "========================="
fi




-------WORDPRESS-------
sudo mariadb
mariadb
mysql -u root -p
------------------
sudo mysql -u root -p
apt search php7.3-xml
sudo apt install php7.3-xsl php7.3-zip php7.3-soap
sudo systemctl restart apache2
sudo ls -al  /var/www/html/
sudo nano /etc/apache2/sites-available/wordpress.conf
sudo a2enmod rewrite
sudo apache2ctl configtest
systemctl restart apache2
sudo rm  /var/www/html/index*
systemctl restart apache2
sudo systemctl restart apache2
cd /tmp
wget--version
wget --version
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
touch /tmp/wordpress/.htaccess
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/ -type f -exec chmod 640 {} \;


sudo apt install curl
curl -s https://api.wordpress.org/secret-key/1.1/salt/
sudo nano /var/www/wordpress/wp-config.php
sudo nano /var/www/html/wp-config.php
sudo systemctl restart apache2



# THANKS
#https://gist.github.com/bgallagh3r/2853221
#https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-debian-10
