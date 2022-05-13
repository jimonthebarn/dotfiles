manp() {
  if [ $# -eq 1 ]; then
    man -t $1 | open -f -a /System/Applications/Preview.app
  else
        echo "Usage: manp [command]"
  fi
}
