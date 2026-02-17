#!/bin/bash 
set -e 
URL="https://tryhackme.com/api/v2/badges/public-profile?userPublicId=2577592" 
chromium --headless --disable-gpu --no-sandbox \ 
--screenshot=badge.png \ 
--window-size=330,175 \ 
--force-device-scale-factor=2 \ 
"$URL" 
convert badge.png -trim +repage badge.png 
git config user.name "IJBaig" 
git config user.email "ijbaig53@gmail.com" 
git add badge.png 
git commit -m "Update THM badge $(date +%F)" || exit 0 
git push https://$GH_TOKEN@github.com/IJBaig/Random-Empty.git HEAD:main
