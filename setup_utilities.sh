#!/bin/bash
cp ./bash_profile ~/.bash_profile
cp ./gitconfig ~/.gitconfig

# update specific variables
email=$(cat gcf.emailaddress)
sed -i -e "s/{gcf.emailaddress}/$email/g" ~/.gitconfig

#source ~/.bash_profile
#exec bash # used to source ~/.bash_profile, not the best but no alternative
