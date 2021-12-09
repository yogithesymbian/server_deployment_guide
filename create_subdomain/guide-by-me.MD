# ssh
```
ssh-keygen -t rsa -b 4096
ssh-copy-id username@ip
```

# Download the file and save as SubdomainGenerator.sh
```
wget -O SubdomainGenerator.sh https://raw.githubusercontent.com/karakanb/nginx-subdomain-generator-script/master/SubdomainGenerator.sh
```

# Change mode of the script to executable.
`chmod +x SubdomainGenerator.sh`

# Run the script with the subdomain and the parent domain as the parameters.
`sudo ./SubdomainGenerator.sh foo example.com`

then go to
`/etc/nginx/sites-available`

replace foo content/text with subdomain file

`sudo systemctl restart nginx`
`sudo nginx -t`

server already.