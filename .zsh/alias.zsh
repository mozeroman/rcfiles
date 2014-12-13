alias emacs='emacs -nw'
alias minecraft='~/.minecraft/HMCL-2.0.9-proguard-Linux.sh'
alias moc='mocp'
alias sai="sudo apt-get install"
alias sar="sudo apt-get remove"
alias sap="sudo apt-get purge"
alias autoremoveclean="sudo apt-get autoclean ; sudo apt-get autoremove"
alias matlab="/media/ubuntu/usr/local/MATLAB/R2012a/bin/matlab"
alias logout="xfce4-session-logout"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias devilspie="devilspie -a & sleep 1 && pkill -f 'devilspie -a'"  

## for fasd
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
