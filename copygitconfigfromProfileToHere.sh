#!/bin/bash
cp ~/.gitconfig ./gitconfig

# update specific variables
email=$(cat gcf.emailaddress)
echo $email
#sed -i -e "s/{gcf.emailaddress}/$email/g" ~/.gitconfig
sed -i -e "s/$email/{gcf.emailaddress}/g" ./gitconfig
