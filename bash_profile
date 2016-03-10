export CLICOLOR=1
export LSCOLORS=exgxxxxxcxxxxxxxxxexex
#export PS1="\e[1;34m\h \w> \e[m"
#export PS1="\e[1;34m\h \w\033[32m\]\$(parse_git_branch)\[\033[00m\] > \e[m"
#export PS1="\e[1;34m\h \w\033[32m\]\$(parse_git_branch)\[\033[00m\] > \e[m"
export PS1="\e[1;34m\h\e[1;34m\$(parse_git_branch) \e[1;34m\w> \e[m"

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

upd_util() {
  # store the current dir
  CUR_DIR=$(pwd)
  
  # update
  cd ~/code/bradvandyk/utilities
  git pull
  ./setup_utilities.sh
  source ~/.bash_profile
  
  # go back to original dir
  cd $CUR_DIR
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

# ruby on rails variables 11-19-15 (hedgeclippers)
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/shims:$PATH"
