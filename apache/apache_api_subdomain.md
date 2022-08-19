<https://www.jagoanhosting.com/tutorial/tutorial-vps/cara-konfigurasi-apache-virtual-hosts-di-ubuntu/var/www/>

├── domain1.com

│   └── public_html

├── domain2.com

│   └── public_html

├── domain3.com

│   └── public_html

sudo mkdir -p /var/www/api.yogi.com/public_html
sudo chown -R www-data: /var/www/api.yogi.com
nano /var/www/api.yogi.com/public_html/index.html
<!DOCTYPE html>

<html lang="en" dir="ltr">

  <head>

    <meta charset="utf-8">

    <title>Welcome to api.yogi.com</title>

  </head>

  <body>

    <h1>Success! api.yogi.com home page!</h1>

  </body>

</html>

/etc/apache2/sites-available/api.yogi.com.conf
<VirtualHost *:80>

    ServerName api.yogi.com

    ServerAlias www.api.yogi.com

    ServerAdmin webmaster@api.yogi.com

    DocumentRoot /var/www/api.yogi.com/public_html

    <Directory /var/www/api.yogi.com/public_html>

        Options -Indexes +FollowSymLinks

        AllowOverride All

    </Directory>

    ProxyPreserveHost On

    ProxyPass / http://127.0.0.1:3000/
    ProxyPassReverse / http://127.0.0.1:3000/

    ErrorLog ${APACHE_LOG_DIR}/api.yogi.com-error.log

    CustomLog ${APACHE_LOG_DIR}/api.yogi.com-access.log combined

</VirtualHost>

```
sudo a2ensite api.yogi.com

or

sudo ln -s /etc/apache2/sites-available/api.yogi.com.conf /etc/apache2/sites-enabled/
```

sudo apachectl configtest
sudo systemctl restart apache2
