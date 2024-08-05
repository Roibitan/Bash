#!/usr/local/bin/tcsh
#####################################################################
# Check args
#####################################################################
if ( $# != 4 ) then
   then
        echo " Usage: runmake       "
endif
set VER = $1
set BB = $2
set TOPIC = $3
set FILE = $4
setenv CMDIR /usr/local/CM
setenv CCMNGRHOME "/usr/local/ccmngr"
set ver_variable = `echo $VER | sed 's/\(.\)\(.\)/v\1_\2/'`

source /etc/csh.login
source ~XX_XXXXX/.cshrc
source ~ccmngr/config/.ccmngr_cshrc
source ~XX_XXXXX/.startup $ver_variable
source $CMDIR/etc/set_params.tcsh
source $CMDIR/etc/set_ts_params.tcsh
source /usr/local/ccmngr/bin/XXXXXXXX -p XXX{$VER} -b {$BB}
echo 'CCWSCA = ' ${CCWSCA}
cd $CCWSCA/$TOPIC/src
echo 'CCVER = ' ${CCVER}


echo 'ver = ' ${VER}
echo 'bb = '  ${BB}
echo 'topic =' ${TOPIC}
echo 'file = ' ${FILE}
echo 'CCVER = ' ${CCVER}
setenv PATH /usr/local/bin:${PATH}
echo 'PATH =' ${PATH}

#####################################################################
# setup proj
#####################################################################
pwd
#####################################################################
# Rename make.bin to temp  file
#####################################################################
if ( -f "make.bin" ) then
    mv make.bin make.bin.$$
else
        echo "NOTE: make.bin does not exist."
endif
#####################################################################
# Rename main.list to temp  file
#####################################################################
if ( -f "main.list" ) then
    mv main.list main.list.$$
endif
#####################################################################
## Populate short main.list file with the server
######################################################################
echo 'build main list file='  ${FILE}
grep  $FILE main.list.$$ > ./main.list
echo 'cat  main.list :'
cat ./main.list
######################################################################
## Create short make.bin file
######################################################################
set SRCFL = "make.bin.$$"
echo $SRCFL
set BUFF = "/tmp/buffer.$$"
# ---------------------------------

# Sanity check : if $SRCFL exists
if ( -f $SRCFL ) then
        # Find #### string
        set STARS = `egrep -n '^####$|^#### $' $SRCFL | awk -F: '{print $1}'`

        if ( "" != "$STARS" ) then
                # Print head of file till #### to BUFF
                head -$STARS $SRCFL > $BUFF
        endif

        # Find NN of line of FILE
        set PTTLN = `grep -nw ^${FILE}  $SRCFL | awk -F: '{print$1}'`
        if ( "" != "$PTTLN" ) then
                set PTTLN = `expr $PTTLN + 1`
                head -$PTTLN $SRCFL | tail -2 >> $BUFF
                cat $BUFF > make.bin
                rm -rf $BUFF
                echo 'cat  make.bin:'
                cat make.bin
        else
#####################################################################
# if requested file is not in make.bin,
# restorue the original  maik.bin only and continue.
#####################################################################
                if ( -f "make.bin.$$" ) then
                        rm -f make.bin
                        mv make.bin.$$ make.bin
                        echo "Continue with original make.bin file"
                endif
        endif
endif

/usr/local/ccmngr/ccgnrl/v08/bin/build_topic -p -m "-k -w" -L
echo "Done"


#####################################################################
# restore the main.list file and save the temp file
#####################################################################
if ( -f "main.list.$$" ) then
        rm -f main.list
        mv main.list.$$ main.list
        echo "main.list file restored"
endif

#####################################################################
# restore the make.bin file and save the temp file
#####################################################################
if ( -f "make.bin.$$" ) then
        rm -f make.bin
        mv make.bin.$$ make.bin
        echo "make.bin file restored"
endif
