
# first on first make sure require

`php --version is php7.4`

```
sudo apt-get install php7.4-mbstring php7.4-xml composer

# or migration/change php version...

# Add the repos containing the newer php packages
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt -y update

# Install PHP 7.4 and extensions
sudo apt -y install php7.4 php7.4-{mysql,mbstring,bcmath,bz2,curl,imagick,dom,zip} libapache2-mod-security2 wget}

sudo a2dismod php7.2
sudo a2enmod php7.4

# Restart the apache 2 | nginx service to activate the new configuration

sudo systemctl restart apache2

sudo service nginx restart
```

<br/>

---

<br/>

```
composer install
```

`check .env for database and other.`

```
php artisan migrate

or

local file

# transfer file into server
scp file.sql user@ip:/home/user

# import sql
mysql -u user -p db_name < file.sql
```

# Permission

```
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

# Check | Pointing Domain Folder

```
/etc/nginx/sites-available/sub-domain.conf

# check on create_subdomain/subdomain file
```

```
sudo systemctl reload nginx
```
