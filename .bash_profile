# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export MOZ_ENABLE_WAYLAND=1
export XDG_PICTURES_DIR=$HOME/Pictures
export XDG_VIDEOS_DIR=$HOME/Videos
export WOFI_DIR=$HOME/.config/wofi
export WOFI_SCRIPTS=$WOFI_DIR/scripts

# grimshot default directory
export XDG_SCREENSHOTS_DIR=$XDG_PICTURES_DIR/Screenshots

createLogDirectory(){
  local logDir;

  if [[ -x $XDG_RUNTIME_DIR ]];then
    logDir="$XDG_RUNTIME_DIR/log"
  else
    logDir="$HOME/.config/log"
  fi

  mkdir -p $logDir

  if [[ -d $logDir ]];then
    echo $logDir
  else
    exit 1
  fi
}

export LOG_DIR=$(createLogDirectory)

cleanLogDirectory(){
  rm -rf $LOG_DIR
}
# debug:0; info:1; warn:2; error:3
export LOG_LEVEL=0
log() {
  local logType;
  logType=$1
  local msg;
  msg=$2
  local logFile;
  logFile="$LOG_DIR/$(basename $0).log"
  dateTime=$(date +'%F %H:%M:%S')
  local logFormat;
  logFormat="[${logType}]\t${dateTime}\tFuncname: ${FUNCNAME[@]/log/}\t[line:$(caller 0 | awk '{print$1}')]\t${msg}"
  {
  case $logType in
    debug)
      [[ $LOG_LEVEL -le 0 ]] && echo -e "\033[37m${logFormat}\033[0m" ;;
    info)
      [[ $LOG_LEVEL -le 1 ]] && echo -e "\033[32m${logFormat}\033[0m" ;;
    warn)
      [[ $LOG_LEVEL -le 2 ]] && echo -e "\033[33m${logFormat}\033[0m" ;;
    error)
      [[ $LOG_LEVEL -le 3 ]] && echo -e "\033[31m${logFormat}\033[0m" ;;
    esac
  } | tee -a $logFile
}
export -f log

singletonize(){
  LOCK_DIR=""$XDG_RUNTIME_DIR"/lock"
  LOCK_FILE="$LOCK_DIR/"$(basename $0)".lock"
  mkdir -p $LOCK_DIR
  touch $LOCK_FILE || {
    echo "Cannot touch "$LOCK_FILE""
    echo "Start Failed"
    exit 1
  }
  exec 7<>"$LOCK_FILE" || {
    echo "Could not bind or echo"
    exit 1
  }
  flock -n 7 || {
    echo "Another thread $(cat $LOCK_FILE) is running"
    exit 0
  }

  trap "rm $LOCK_FILE" EXIT KILL
  echo $$ >> "$LOCK_FILE"
  echo "Declared as singleton"
}
export -f singletonize

. $HOME/.cargo/env
# User specific environment and startup programs
[[ "$(tty)" = "/dev/tty1" ]] && exec sway
