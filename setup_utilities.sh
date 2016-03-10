#!/bin/bash
cp ./bash_profile ~/.bash_profile
cp ./gitconfig ~/.gitconfig

# update specific variables
email=$(cat gitconfig.emailaddress)
echo $email
sed -i -e "s/{gitconfig.emailaddress}/$email/g" ~/.gitconfig

#source ~/.bash_profile
#exec bash # used to source ~/.bash_profile, not the best but no alternative
