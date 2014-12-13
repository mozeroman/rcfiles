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
## one direction only
## useful dirs, a function combine fasd -d&percol and other program, sudo su might be useful
fd() {
   temp=$(fasd -d | percol);
   temp=${temp##* }; #only display dir
   ##this one will do the same--only display dir
   #temp=${temp##*/};
   #temp="/"$temp;
   if [ $1 ] ; then
       case $1 in
           e) emacs -nw $temp $2 ;;
           v) vim $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i $temp $2;; ## -i worldn't ask, just force
           mv) mv -i $temp $2;; ## -i worldn't ask, just force
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act like cd
       $temp
   fi
}

## useful files, a function combine fasd -f&percol and other program, sudo su might be useful
ff() {
   temp=$(fasd -f | percol);
   temp=${temp##* }; #only display dir
   #temp="/"$temp;
   if [ $1 ] ; then
       case $1 in
           e) emacs -nw $temp $2 ;;
           v) vim $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i $temp $2;; ## -i worldn't ask, just force
           mv) mv -i $temp $2;; ## -i worldn't ask, just force
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act like cd
       $temp
   fi
}

## useful files & dirs, a function combine fasd -f&percol and other program, sudo su might be useful
fa() {
   temp=$(fasd -a | percol);
   temp=${temp##* }; #only display dir
   #temp="/"$temp;
   if [ $1 ] ; then
       case $1 in
           e) emacs -nw $temp $2 ;;
           v) vim $temp $2 ;;
           rm) rm $temp -rf ;;
           cp) cp -i $temp $2;; ## -i worldn't ask, just force
           mv) mv -i $temp $2;; ## -i worldn't ask, just force
           *)  $1 $temp $2 ;;
       esac
   else
       ##will act like cd
       $temp
   fi
}