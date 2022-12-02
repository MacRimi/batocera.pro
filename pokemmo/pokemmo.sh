#!/usr/bin/env bash 
# BATOCERA.PRO INSTALLER
######################################################################
APPNAME=pokemmo 
APPLINK=https://pokemmo.com/download_file/1/
APPHOME="pokemmo.com/downloads/portable/"
#---------------------------------------------------------------------
AppName=PokeMMO.sh
INFONAME=POKEMMO
PORTNAME=PokeMMO.sh
######################################################################
#---------------------------------------------------------------------
COMMAND='su -c "DISPLAY=:0.0 /userdata/system/pro/'$APPNAME'/'$AppName'" root'
#--------------------------------------------------------------------- 
######################################################################
APPNAME="${APPNAME^^}"; ORIGIN="${APPHOME^^}"; appname=$(echo "$APPNAME" | awk '{print tolower($0)}'); APPPATH=/userdata/system/pro/$appname/$AppName
# --------------------------------------------------------------------
# show console/ssh info: 
clear 
echo 
echo 
echo 
echo -e "${X}PREPARING $APPNAME INSTALLER, PLEASE WAIT . . . ${X}"
echo 
echo 
echo 
# --------------------------------------------------------------------
# -- output colors:
###########################
X='\033[0m'               # / resetcolor
W='\033[0;37m'            # white
#-------------------------#
RED='\033[1;31m'          # red
BLUE='\033[1;34m'         # blue
GREEN='\033[1;32m'        # green
PURPLE='\033[1;35m'       # purple
DARKRED='\033[0;31m'      # darkred
DARKBLUE='\033[0;34m'     # darkblue
DARKGREEN='\033[0;32m'    # darkgreen
DARKPURPLE='\033[0;35m'   # darkpurple
###########################
# --------------------------------------------------------------------
# -- console theme
L=$X
R=$X
# --------------------------------------------------------------------
# -- prepare paths and files for installation: 
cd ~/
pro=/userdata/system/pro
mkdir $pro 2>/dev/null
mkdir $pro/extra 2>/dev/null
rm -rf $pro/$appname 2>/dev/null
mkdir $pro/$appname 2>/dev/null
mkdir $pro/$appname/extra 2>/dev/null
# --------------------------------------------------------------------
# -- pass launcher command as cookie for main function: 
command=$pro/$appname/extra/command; rm $command 2>/dev/null;
echo "$COMMAND" >> $command 2>/dev/null 
# --------------------------------------------------------------------
# -- prepare dependencies for this app and the installer: 
url=https://github.com/uureel/batocera.pro/raw/main/.dep
depfile=dependencies.txt; dep=$pro/.dep; mkdir $pro/.dep 2>/dev/null; cd $dep
wget -q -O $dep/$depfile $url/$depfile 2>/dev/null; dos2unix $dep/$depfile;
nl=$(cat $dep/$depfile | wc -l); l=1; while [[ "$l" -le "$((nl+2))" ]]; do
d=$(cat $dep/$depfile | sed ""$l"q;d"); wget -q -O $dep/$d $url/$d 2>/dev/null; 
if [[ "$(echo $d | grep "lib")" != "" ]]; then ln -s $dep/$d /lib/$d 2>/dev/null; fi; ((l++)); done
wget -q -O $pro/$appname/extra/icon.png https://github.com/uureel/batocera.pro/raw/main/$appname/extra/icon.png; chmod a+x $dep/tput; cd ~/
# --------------------------------------------------------------------
# // end of dependencies 
#
# --------------------------------------------------------------------
# -- run before installer:  
#killall wget 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null && killall $AppName 2>/dev/null
# --------------------------------------------------------------------
cols=$($dep/tput cols); rm -rf /userdata/system/pro/$appname/extra/cols
echo $cols >> /userdata/system/pro/$appname/extra/cols
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
# -- show console/ssh info: 
clear
echo
echo
echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
echo -e "${W}- - - - - - -"
echo
echo
echo
sleep 0.33
clear
echo
echo -e "${W}- - - - - - -"
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33
clear
line $cols '\'; echo
line $cols '/'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.PRO/$APPNAME INSTALLER${X}"
line $cols ' '; echo
line $cols '/'; echo
line $cols '\'; echo

sleep 0.33
echo
echo -e "${X}THIS WILL INSTALL $INFONAME FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}$APPNAME WILL BE AVAILABLE IN PORTS"
echo -e "${X}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${X}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo
echo -e "${X}FOLLOW THE BATOCERA DISPLAY"
echo
echo -e "${X}. . .${X}" 
echo
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# --------------------------------------------------------------------
#\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
# -- THIS WILL BE SHOWN ON MAIN BATOCERA DISPLAY:   
function batocera-pro-installer {
APPNAME="$1"
appname="$2"
AppName="$3"
APPPATH="$4"
APPLINK="$5"
ORIGIN="$6"
INFONAME="$7"
PORTNAME="$8"
# --------------------------------------------------------------------
# -- colors: 
###########################
X='\033[0m'               # / resetcolor
W='\033[0;37m'            # white
#-------------------------#
RED='\033[1;31m'          # red
BLUE='\033[1;34m'         # blue
GREEN='\033[1;32m'        # green
PURPLE='\033[1;35m'       # purple
DARKRED='\033[0;31m'      # darkred
DARKBLUE='\033[0;34m'     # darkblue
DARKGREEN='\033[0;32m'    # darkgreen
DARKPURPLE='\033[0;35m'   # darkpurple
###########################
# -- display theme:
L=$W
T=$W
R=$RED
B=$BLUE
G=$GREEN
P=$PURPLE
# --------------------------------------------------------------------
cols=$(cat /userdata/system/pro/.dep/display.cfg | tail -n 1)
cols=$(bc <<<"scale=0;$cols/1.3") 2>/dev/null
#cols=$(cat /userdata/system/pro/$appname/extra/cols | tail -n 1)
line(){
  local start=1
  local end=${1:-80}
  local str="${2:-=}"
  local range=$(seq $start $end)
  for i in $range ; do echo -n "${str}"; done
}
clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
sleep 0.33

clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
sleep 0.33

clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33

clear
echo
echo -e "${W}- - - - - - -"
echo
echo -e "${W}BATOCERA.PRO/${W}$APPNAME${W} INSTALLER ${W}"
echo
echo -e "${W}- - - - - - -"
echo
sleep 0.33

clear
echo -e "${W}- - - - - - -"
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo -e "${W}- - - - - - -"
sleep 0.33

clear
echo
echo
echo
echo -e "${W}BATOCERA.PRO/${G}$APPNAME${W} INSTALLER ${W}"
echo
echo
echo
sleep 0.33

echo -e "${W}THIS WILL INSTALL $INFONAME FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo
echo -e "${W}$APPNAME WILL BE AVAILABLE IN PORTS"
echo -e "${W}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${W}AND INSTALLED IN /USERDATA/SYSTEM/PRO/$APPNAME"
echo 
echo -e "${G}> > > ${W}PRESS ENTER TO CONTINUE" 
read -p ""
echo; 
# --------------------------------------------------------------------
# -- check system before proceeding
if [[ "$(uname -a | grep "x86_64")" != "" ]]; then 
:
else
echo
echo -e "${RED}ERROR: SYSTEM NOT SUPPORTED"
echo -e "${RED}YOU NEED BATOCERA X86_64${X}"
echo
sleep 5
exit 0
# quit
exit 0
fi
# --------------------------------------------------------------------
# -- temp for curl download
pro=/userdata/system/pro
temp=$pro/$appname/extra/downloads
rm -rf $temp 2>/dev/null 
mkdir -p $temp 2>/dev/null
# --------------------------------------------------------------------
#
echo
echo -e "${G}DOWNLOADING${W}"
sleep 1
cd $pro/$appname
su -c "cd $pro/$appname && wget -q --show-progress https://pokemmo.com/download_file/1/ -O $pro/$appname/PokeMMO.zip" root 
cd ~/
SIZE=$(($(wc -c $pro/$appname/PokeMMO.zip | awk '{print $1}')/1048576)) 2>/dev/null
echo -e "${T}$pro/$appname/PokeMMO.zip   ${T}$SIZE( )MB   ${G}OK${W}" | sed 's/( )//g'
echo -e "${G}> ${W}DONE" 
echo
sleep 1.333 
# 
# -------------------------------------------------------------------- 
echo -e "${G}INSTALLING${W}" 
#
yes "A" | unzip -qq $pro/$appname/PokeMMO.zip -d $pro/$appname/ 2>/dev/null
rm -rf $pro/$appname/PokeMMO.zip 2>/dev/null
rm -rf $temp 2>/dev/null
# -- increase java memsize: 
sed -i 's,'Xmx384M','Xmx768M',g' $pro/$appname/$AppName 2>/dev/null 
# -- prepare launcher to solve dependencies on each run and avoid overlay, 
launcher=/userdata/system/pro/$appname/Launcher
rm -rf $launcher
echo '#!/bin/bash ' >> $launcher
echo ' dep=/userdata/system/pro/.dep; depfile=$dep/dependencies.txt; ' >> $launcher
echo ' nl=$(cat $depfile | wc -l); l=1; while [[ "$l" -le "$((nl+2))" ]]; do ' >> $launcher
echo ' d=$(cat $depfile | sed ""$l"q;d"); if [[ "$(echo $d | grep "lib")" != "" ]]; then ' >> $launcher
echo ' cp $dep/$d /lib/$d 2>/dev/null; fi; ((l++)); done ' >> $launcher
echo 'cd '$pro'/'$appname'/' >> $launcher  
echo 'export JAVA_HOME=/userdata/system/pro/java/bin' >> $launcher
echo 'export PATH=/userdata/system/pro/java/bin:$PATH ' >> $launcher
echo 'unclutter-remote -s' >> $launcher 
## -- GET APP SPECIFIC LAUNCHER COMMAND: 
######################################################################
echo "$(cat /userdata/system/pro/$appname/extra/command)" >> $launcher
######################################################################
dos2unix $launcher
chmod a+x $launcher
rm /userdata/system/pro/$appname/extra/command 2>/dev/null
# --------------------------------------------------------------------
# -- prepare f1 - applications - app shortcut, 
shortcut=/userdata/system/pro/$appname/extra/$appname.desktop
rm -rf $shortcut 2>/dev/null
echo "[Desktop Entry]" >> $shortcut
echo "Version=1.0" >> $shortcut
echo "Icon=/userdata/system/pro/$appname/extra/icon.png" >> $shortcut
echo "Exec=/userdata/system/pro/$appname/Launcher" >> $shortcut
echo "Terminal=false" >> $shortcut
echo "Type=Application" >> $shortcut
echo "Categories=Game;batocera.linux;" >> $shortcut
echo "Name=$appname" >> $shortcut
f1shortcut=/usr/share/applications/$appname.desktop
dos2unix $shortcut 
chmod a+x $shortcut 
cp $shortcut $f1shortcut 2>/dev/null
# --------------------------------------------------------------------
# -- prepare Ports file, 
portfile="$pro/$appname/extra/$PORTNAME"
echo '#!/usr/bin/env bash' >> "$portfile"
echo 'cd '$pro'/'$appname'/' >> "$portfile"  
echo 'export JAVA_HOME=/userdata/system/pro/java/bin' >> "$portfile"
echo 'export PATH=/userdata/system/pro/java/bin:$PATH ' >> "$portfile"
echo 'unclutter-remote -s' >> "$portfile"
echo '/userdata/system/pro/'$appname'/Launcher' >> "$portfile" 
dos2unix "$portfile" 
chmod a+x "$portfile" 
cp "$portfile" "/userdata/roms/ports/$PORTNAME" 
# --------------------------------------------------------------------
# -- get padtokey profile 
#
# --------------------------------------------------------------------
# -- prepare prelauncher to avoid overlay,
pre=/userdata/system/pro/$appname/extra/startup
rm -rf $pre 2>/dev/null
echo "#!/usr/bin/env bash" >> $pre
echo "cp /userdata/system/pro/$appname/extra/$appname.desktop /usr/share/applications/ 2>/dev/null" >> $pre
dos2unix $pre
chmod a+x $pre
# -- add prelauncher to custom.sh to run @ reboot
csh=/userdata/system/custom.sh
startup=/userdata/system/pro/$appname/extra/startup
if [[ -e $csh ]];
then
   tmp=/userdata/system/customsh.tmp
   remove=/userdata/system/pro/$appname/extra/startup
   rm $tmp 2>/dev/null
   nl=$(cat $csh | wc -l)
   l=1; while [[ $l -le $nl ]]; do
   ln=$(cat $csh | sed ""$l"q;d")
   if [[ "$(echo $ln | grep "$remove")" != "" ]]; then :; else echo "$ln" >> $tmp; fi
   ((l++))
   done
   cp $tmp $csh 2>/dev/null
   rm $tmp 2>/dev/null
   echo -e "\n$startup \n" >> $csh   
   dos2unix $csh 
   chmod a+x $csh 
else 
   echo -e "\n$startup \n" >> $csh
fi 
dos2unix $csh 2>/dev/null
chmod a+x $csh
echo -e "${G}> ${W}DONE" 
sleep 1
echo
echo
echo -e "${W}> $APPNAME INSTALLED ${G}OK${W}"
sleep 1
echo
echo
if [[ "$(java --version | sed '1q;d' | awk '{print $2}')" < "19" ]]; then
echo -e "${R}--------------------------------------------${W}"
echo -e "${R}YOU ALSO NEED TO INSTALL LATEST JAVA-RUNTIME${W}" 
echo -e "${R}--------------------------------------------${W}"
fi
sleep 3
# reaload for ports file
curl http://127.0.0.1:1234/reloadgames
}
export -f batocera-pro-installer 2>/dev/null
# --------------------------------------------------------------------
# -- include display output: 
function get-xterm-fontsize {
tput=/userdata/system/pro/.dep/tput; chmod a+x $tput; 
cp /userdata/system/pro/.dep/libtinfo.so.6 /lib/libtinfo.so.6 2>/dev/null
cfg=/userdata/system/pro/.dep/display.cfg; rm $cfg 2>/dev/null
DISPLAY=:0.0 xterm -fullscreen -bg "black" -fa "Monospace" -e bash -c "$tput cols >> $cfg" 2>/dev/null
cols=$(cat $cfg | tail -n 1) 2>/dev/null
TEXT_SIZE=$(bc <<<"scale=0;$cols/16") 2>/dev/null
}
export -f get-xterm-fontsize 2>/dev/null
get-xterm-fontsize 2>/dev/null
cfg=/userdata/system/pro/.dep/display.cfg
cols=$(cat $cfg | tail -n 1) 2>/dev/null
until [[ "$cols" != "80" ]] 
do
get-xterm-fontsize 2>/dev/null
cols=$(cat $cfg | tail -n 1) 2>/dev/null
done 
TEXT_SIZE=$(bc <<<"scale=0;$cols/16") 2>/dev/null
# --------------------------------------------------------------------
# RUN:
# |
  DISPLAY=:0.0 xterm -fullscreen -bg black -fa 'Monospace' -fs $TEXT_SIZE -e bash -c "batocera-pro-installer '$APPNAME' '$appname' '$AppName' '$APPPATH' '$APPLINK' '$ORIGIN' '$INFONAME' '$PORTNAME'" 2>/dev/null
# --------------------------------------------------------------------
# BATOCERA.PRO INSTALLER //
##########################
exit 0
