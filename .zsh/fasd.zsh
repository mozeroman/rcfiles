## fasd start with zsh
eval "$(fasd --init auto)"

# ## for fasd
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection

### find a way to combine code in fd fa ff
## fasd history save in ~/.fasd
## work one direction/file only
## useful dirs, a function combine fasd -d&percol and other program, sudo su might be useful
fd() {
   temp=$(fasd -d | percol);
   temp=${temp##* }; #only display dir
   ##this one will do the same--only display dir
   if [ $1 ] ; then
       case $1 in
           rm) rm $temp -rf ;;
           cp) cp -i -r $temp $2;;
           mv) mv -i $temp $2;;
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act as cd $temp
       $temp
   fi
}

## useful files, a function combine fasd -f&percol and other program, sudo su might be useful
ff() {
   temp=$(fasd -f | percol);
   temp=${temp##* }; #only display dir
   if [ $1 ] ; then
       case $1 in
           e) TERM=xterm-256color emacsclient -nw $temp $2 ;;
           se) sudo TERM=xterm-256color emacsclient -nw $temp $2 ;;
           v) vim $temp $2 ;;
           sv) sudo vim $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i -r $temp $2;;
           mv) mv -i $temp $2;;
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act as cd $temp
       $temp
   fi
}

## useful files & dirs, a function combine fasd -f&percol and other program, sudo su might be useful
fa() {
   temp=$(fasd -a | percol);
   temp=${temp##* }; #only display dir
   if [ $1 ] ; then
       case $1 in
           e) TERM=xterm-256color emacsclient -nw $temp $2 ;;
           se) sudo TERM=xterm-256color emacsclient -nw $temp $2 ;;
           v) vim $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i -r $temp $2;;
           mv) mv -i $temp $2;;
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act as cd $temp
       $temp
   fi
}
