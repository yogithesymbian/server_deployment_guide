<https://www.jagoanhosting.com/tutorial/tutorial-vps/cara-konfigurasi-apache-virtual-hosts-di-ubuntu/var/www/>

├── domain1.com

│   └── public_html

├── domain2.com

│   └── public_html

├── domain3.com

│   └── public_html

sudo mkdir -p /var/www/yogithesymbian.com/public_html
sudo chown -R www-data: /var/www/yogithesymbian.com
nano /var/www/yogithesymbian.com/public_html/index.html
<!DOCTYPE html>

<html lang="en" dir="ltr">

  <head>

    <meta charset="utf-8">

    <title>Welcome to yogithesymbian.com</title>

  </head>

  <body>

    <h1>Success! yogithesymbian.com home page!</h1>

  </body>

</html>

/etc/apache2/sites-available/yogithesymbian.com.conf
<VirtualHost *:80>

    ServerName yogithesymbian.com

    ServerAlias www.yogithesymbian.com

    ServerAdmin webmaster@yogithesymbian.com

    DocumentRoot /var/www/yogithesymbian.com/public_html

    <Directory /var/www/yogithesymbian.com/public_html>

        Options -Indexes +FollowSymLinks

        AllowOverride All

    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/yogithesymbian.com-error.log

    CustomLog ${APACHE_LOG_DIR}/yogithesymbian.com-access.log combined

</VirtualHost>

```
sudo a2ensite yogithesymbian.com

or

sudo ln -s /etc/apache2/sites-available/yogithesymbian.com.conf /etc/apache2/sites-enabled/
```

sudo apachectl configtest
sudo systemctl restart apache2
