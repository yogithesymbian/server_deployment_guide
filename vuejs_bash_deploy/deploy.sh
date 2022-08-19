#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

# first
git init
git add -A
git commit -m 'deploy'
git branch -M main
git remote add origin https://github.com/yogithesymbian/x.git
git config --global http.postBuffer 157286400
git gc
git push origin main

# next
# git add -A
# git commit -m 'deploy'
# git config --global http.postBuffer 157286400
# git gc
# git push origin main
cd ..