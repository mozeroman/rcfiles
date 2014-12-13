
# ## for fasd
# eval "$(fasd --init auto)"
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection

### $dir have extra informations should be delete
## a function combine fasd -d&percol and other program, sudo su might be useful
fd() {
   temp=$(fasd -d | percol);
   if [ -f $1 ] ; then
       case $1 in
           emacs)  emacs -nw $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i $temp $2;; ## -i worldn't ask, just force
           mv) mv -i $temp $2;; ## -i worldn't ask, just force
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act like cd
       $1 $dir $2
   fi
}
