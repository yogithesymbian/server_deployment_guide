```
ssh-keygen -t ed25519 -C "yogirenbox33@gmail.com"
```

```
eval "$(ssh-agent -s)"
```

`sudo nano ~/.ssh/config`

```
Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  # UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

```
ssh-add ~/.ssh/id_ed25519
```
