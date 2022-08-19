# MAKE SURE PACKAGE STABLE VERSION

```
$ npm install -g n
# $ n latest

$ n stable

$ n 0.10.33          # Install and use v0.10.33

$ n

  0.10.26
• 0.8.17
  0.9.6
```

# DEPLOYMENT

## Aliyun Linux Server | HTTPD/APACHE

```
#/etc/systemd/system/node-gjmf-1.service

Description = node-gjmf-1.service
After network.target = node-gjmf-1.service

[Service]
ExecStart=/usr/bin/npm run dev /var/www/html/api/gjmf-api-nodejs/server.js
Restart=on-failure
StandardOutput=syslog
StandardError=syslog

SyslogIdentifier=node-gjmf-1
User=nobody
Group=root

Environment=NODE_ENV=production PORT=3005
WorkingDirectory=/var/www/html/api/gjmf-api-nodejs

[Install]
WantedBy=multi-user.target
```

Then run the following to start both instances of our node application

`$ systemctl start node-gjmf-1`
The first instance will be accepting requests at port 5000, where as the other one at port 5001. If any of them crashes it will automatically be restarted.

To make your node app instances run when the server starts do the following

`$ systemctl enable node-gjmf-1`
In case there are problems with any of the following commands above you can use any of these two:

```
sudo systemctl status node-gjmf-1 -n 100 --no-pager
sudo journalctl -u node-gjmf-1 -n 100 --no-pager
```

The first line will show your app instance current status and whether it is running. The second command will show you all logging information including output on standard error and standard output streams from your instance.

Use the first command right now to see whether your app is running or whether there has been some problem starting it.

Re-deploying your app
With the current setup, if we have some new application code in our repository, all you have to do is the following

```
cd /opt/app
git pull
sudo systemctl restart node-gjmf-1
```

## firewall

```
sudo ufw allow 5000 // execute to allow on port
sudo ufw status verbose // status
```

# HEROKU

Start your app locally using the heroku local command, which is installed as part of the Heroku CLI.
`heroku local web`

```
/node_modules
npm-debug.log
.DS_Store
/*.env
```

Deploy your application to Heroku
After you commit your changes to git, you can deploy your app to Heroku.

```
git add .
git commit -m "Added a Procfile."
heroku login
Enter your Heroku credentials.
...
heroku create
Creating arcane-lowlands-8408... done, stack is cedar
http://arcane-lowlands-8408.herokuapp.com/ | git@heroku.com:arcane-lowlands-8408.git
Git remote heroku added
git push heroku master
...
-----> Node.js app detected
...
-----> Launching... done
       http://arcane-lowlands-8408.herokuapp.com deployed to Heroku
```
