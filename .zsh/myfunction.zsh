# setting Fcitx as input method
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

# extract multi-type files
extract() {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)  tar xf $1      ;;
           *.tar.gz)   tar xf $1      ;;
           *.bz2)      bunzip2 $1      ;;
           *.rar)      rar x $1        ;;
           *.gz)       gunzip $1       ;;
           *.tar)      tar xf $1       ;;
           *.tbz2)     tar xf $1      ;;
           *.tgz)      tar xf $1      ;;
           *.zip)      unzip $1        ;;
           *.7z)       7z x $1        ;;
           *.Z)        uncompress $1   ;;
           *)          echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}

## I learn from above to program a file copy function for xsel
copy() {
       if [ -f $1 ] ; then
           case $1 in
               *) cat $1 | xsel -b ;;
           esac
       else
           echo "'$1' is not a valid file"
       fi
}

## a file selection copy function for xsel | percol
scopy() {
       if [ -f $1 ] ; then
           case $1 in
               *) percol $1 | xsel -b ;;
           esac
       else
           echo "'$1' is not a valid file"
       fi
}

## a function for selection rm | percol
rms() {
    rm $(ls | percol) -rf
}
###problem accour with function-name scp comflict with ^R
## a function for selection cp | percol
cps() {
    cp -i $(ls | percol) $1
}
## a function for selection mv | percol
mvs() {
    mv -i $(ls | percol) $1
}
## a function for selection cd | percol
cds() {
    cd $(ls | percol)
}
## a function for selection extract | percol
extracts() {
    extract $(ls | percol)
}

## wouldn't seperate $dir and it just a WHOLE-STRING, so only one file can be seleted
## a function combine ls&percol and other program, sudo su might be useful
lss() {
   dir=$(ls | percol);
   #dir=$(ls | percol | tr '\n' ' ');
   #echo ${dir/\n/ };
   #echo $dir
   #echo $dir | tr '\n' ' ';
   #rdir=$($dir|sed 'N;s/\n//g');
   #rdir=sed 'N;s/\n/ /g' $dir;
   #rdir=$($dir | tr '\n' ‘ ’ );
   #dir=sed 'N;s/\n/:/' $dir;
   if [ $1 ] ; then
       case $1 in
           e)  emacsclient -nw $dir $2;;
           v)  vim  $dir $2;;
           rm) rm -rf $dir ;;
           cp) cp -i $dir $2;; ## -i worldn't ask, just force
           mv) mv -i $dir $2;; ## -i worldn't ask, just force
           *)  $1 $dir $2 ;; ##will act like cd
       esac
   else
       ##will act like cd
       $dir
   fi
}

## Do not save same history
setopt hist_ignore_all_dups

