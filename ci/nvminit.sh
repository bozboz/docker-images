#!/bin/bash
# shellcheck disable=SC2068
source /home/php/.bashrc

NVM_DIR="/home/php/.nvm"
source "$NVM_DIR/nvm.sh"

nvm_auto install
nvm ${@:1}
