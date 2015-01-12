# setting Fcitx as input method
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

# extract multi-type files
open() {
   if [ -f $1 ] ; then
       case $1 in
           *.doc) libreoffice   $1 & ;;
           *.odt) libreoffice   $1 & ;;
           *.gif) firefox   $1       ;;
           *.chm) firefox   $1       ;;
           *.pdf) evince    $1 &     ;;
           *.png) ristretto $1 &     ;;
           *.jpg) ristretto $1 &     ;;
           *.org) e $1      ;;
           *.mp4) vlc $1      ;;
           *)          echo "'$1' cannot be opened via open()" ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}

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
    cp -i -r $(ls | percol) $1
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

## a function combine ls&percol and other program, sudo su might be useful, single file only
lss() {
   dir=$(ls | percol);
   #can sub '\n' with ' ' but '* *' was recognized as A command with ' ' in between
   #dir=$(ls | percol | tr '\n' ' ');
   #echo $dir | tr '\n' ' ';
   #rdir=$($dir | tr '\n' ‘ ’ );
   if [ $1 ] ; then
       case $1 in
           e)  TERM=xterm-256color emacsclient -nw $dir $2;;
           v)  vim  $dir $2;;
           rm) rm -rf $dir ;;
           cp) cp -i -r $dir $2;;
           mv) mv -i $dir $2;;
           *)  $1 $dir $2 ;;
       esac
   else
       ##will act as cd
       $dir
   fi
}

## Do not save same history
setopt hist_ignore_all_dups

##set TERM=xterm-256color emacsclient -nw -a "" as default editor
export EDITOR="e"

# a sample to start program with zsh, and wouldn't start again when program running
alias emacsd='(emacs --daemon &)'
# run emacs daemon
[[ -z $(ps -C 'emacs --daemon' -o pid=) ]] && emacsd

# # run devilspie but wait for secs
# (sleep 16) && devilspie
