#!/bin/zsh
#startup using command "sh ~/.devilspie/start.sh"
(sleep 16) && devilspie && pkill -f '~/.devilspie/startup.sh'
