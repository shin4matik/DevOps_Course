#!/usr/bin/bash
#######################################  
# Bash script to install an LAMP stack on Debian 10 (Buster)
# Author:   Volodymyr Borys
   
# Check if running as root  
#if [ "$(id -u)" != "0" ]; then  
#  echo "This script must be run as root" 1>&2  
#  exit 1  
#fi  

clear

# Color Reset
Color_Off='\033[0m'       # Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan


update() {
	# Update system repos
	echo -e "\n ${Cyan} Updating repositories.. ${Color_Off}"
	sudo apt update -q
}

configureUFW(){
	echo -e "\n ${Cyan} Installing Apache.. ${Color_Off}"
	sudo apt install -y ufw
	sudo ufw enable
	sudo ufw allow in "WWW Full"
	sudo ufw status
}

installApache(){
	echo -e "\n ${Cyan} Installing Apache server.. ${Color_Off}"
	sudo apt install -y apache2
}

restartApache(){
	echo -e "\n ${Cyan} Restart Apache server.. ${Color_Off}"
	sudo systemctl restart apache2
}

installMariaDB() {
	echo -e "\n ${Cyan} Installing MariaDB.. ${Color_Off}"
	sudo apt install -y mariadb-server mariadb-client

}

installPHP() {
	# PHP and Modules
	echo -e "\n ${Cyan} Installing PHP and common modules.. ${Color_Off}"
	sudo apt install -y php7.3 libapache2-mod-php7.3

	sudo apt install -y php7.3-mysql php7.3-curl php7.3-gd php7.3-intl php-pear php-imagick php7.3-imap php-memcache php7.3-pspell php7.3-recode php7.3-sqlite3 php7.3-tidy php7.3-xml php7.3-xmlrpc php7.3-mbstring php-gettext php7.3-xsl php7.3-zip php7.3-soap


}

createSSLcertificate(){
	echo -e "\n ${Cyan} Create a Self-Signed SSL Certificate for Apache.. ${Color_Off}"
	sudo apt install -y php-apcu
	sudo a2enmod ssl 
	sudo a2ensite default-ssl
}

testPHP (){
sudo tee -a /var/www/html/index.php > /dev/null <<EOT
<?php
phpinfo();
?>
EOT
}

setPermissions() {
	echo -e "\n ${Cyan} Setting Ownership for /var/www.. ${Color_Off}"
	sudo chown -R www-data:www-data /var/www
}


# RUN
update
configureUFW
installApache
restartApache
installMariaDB
installPHP
createSSLcertificate
testPHP
setPermissions









#THANK'S
#https://github.com/aamnah/bash-scripts/blob/master/install/amp_debian.sh
#https://www.serverkaka.com/2018/12/install-lamp-stack-in-ubuntu-using-shell-script.html
# https://gist.github.com/Mins/4602864
