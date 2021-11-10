#!/bin/bash
source /home/php/.bashrc
fn_exists() {
  # appended double quote is an ugly trick to make sure we do get a string -- if $1 is not a known command, type does not output anything
  [ `type -t $1`"" == 'function' ]
}

if ! fn_exists "nvm"; then
  NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh" # This loads nvm
fi
if test -f ".nvmrc"; then nvm use || nvm install; fi
# shellcheck disable=SC2068
nvm ${@:1}
