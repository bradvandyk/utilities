# VARIABLES
# VARIABLES
# VARIABLES
export CLICOLOR=1
export LSCOLORS=exgxxxxxcxxxxxxxxxexex
#export PS1="\e[1;34m\h \w> \e[m"
#export PS1="\e[1;34m\h \w\033[32m\]\$(parse_git_branch)\[\033[00m\] > \e[m"
#export PS1="\e[1;34m\h \w\033[32m\]\$(parse_git_branch)\[\033[00m\] > \e[m"
export PS1="\e[1;34m\h\e[1;34m\$(parse_git_branch) \e[1;34m\w> \e[m"

# FUNCTIONS
# FUNCTIONS
# FUNCTIONS
function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

function backup {
  ~/code/bradvandyk/utilities/scripts/backup $@
}

function isgit {
  if [ -d .git ]; then
    echo .git;
  else
    git rev-parse --git-dir 2> /dev/null;
  fi;
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function upd_util() {
  # store the current dir
  CUR_DIR=$(pwd)
  
  # update
  cd ~/code/bradvandyk/utilities
  git pull
  ./setup_utilities.sh
  source ~/.bash_profile
  
  # go back to original dir
  cd "$CUR_DIR"
}

function send() {
  python ~/code/bradvandyk/utilities/scripts/sendmyemail.py $@
}

function do_git {
  cmd=$1
  shift
  extra=""
  if [ "$cmd" == "log" ]; then
    extra="-8 --pretty=format:"%h%x09%an%x09%ad%x09%s""
  elif [ "$cmd" == "rm" ]; then
    extra="--cached"
  fi
  
  git="$(which git)"
  ex="$git $cmd $extra $@"
  ${ex}
}

alias  gits='do_git'
alias gi='git'
