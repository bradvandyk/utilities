export CLICOLOR=1
export LSCOLORS=exgxxxxxcxxxxxxxxxexex
export PS1="\e[1;34m\h \w> \e[m"

function tabname {
  printf "\e]1;$1\a"
}
 
function winname {
  printf "\e]2;$1\a"
}

function reload_util {
  git pull
  ~/code/bradvandyk/utilities/setup_script.py
  source ~/.bash_profile
}
