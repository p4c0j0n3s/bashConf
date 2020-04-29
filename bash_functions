# FUNCTIONS

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi  
}

lsloc() {
  locate "$@" | 
    while read -r name; do
      ls -ld "$name"
    done
}


# SERVICE

function s_start {
    service $1 start
}

function s_stop {
    service $1 stop
}

function s_status {
    if [ $# -eq "0" ]; then
        service --status-all;
    else
        if [ $# -eq "1" ]; then
            service --status-all | grep --color=auto $1;
        fi;
    fi
}
