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
    rm $(ls | percol)
}

###problem accour with function-name scp comflict with ^R
## a function for selection cp | percol
cps() {
    cp $(ls | percol)
}

## a function for selection mv | percol
mvs() {
    mv $(ls | percol) -rf
}

## a function for selection cd | percol
cds() {
    cd $(ls | percol)
}

## Do not save same history
setopt hist_ignore_all_dups
