#!/usr/local/bin/tcsh

set file_name = $1
set proj = $2
set ver_id = $3
set topic = $4
set bb = $5

set ver_variable = `echo $ver_id | sed 's/\(.\)\(.\)/v\1_\2/'`

setenv CMDIR /usr/local/XXXXXX
source /XXXXXX/XXXXXX/XXXXXX/XX_XXXXX/.cshrc
source /clchome/clc/XXXXX/XX_XXXXX/.login
source /usr/local/XXXXXX/config/.XXXXXX_cshrc
source /usr/local/XXXXXX/config/.XXXXXX_login
source /etc/csh.cshrc
source /etc/csh.login
source ~XX_XXXXX/.cshrc
source ~XXXXXX/config/.XXXXXX_cshrc
source ~XX_XXXXX/.startup $ver_variable
source $CMDIR/etc/set_params.tcsh
source $CMDIR/etc/set_ts_params.tcsh
source /usr/local/XXXXXX/bin/XXXXXXXX -p ${proj}${ver_id} -b $bb



cd $CCWSCA/${topic}/src

if ($bb == XXXXX) then

echo "$file_name"
echo "B4_build XXXXX"

build_file -p -m "-k -w" $file_name
echo "Af_build XXXXX"

else

if ($bb == XXXXXX) then
cd $CCWSCA/${topic}
echo "B4_build XXXXX"
/usr/local/XXXXXX/ccgnrl/v08/bin/build_XXX  -t ${topic} -p -m "-k -w" -d  | & tee ~/log.$CCPROJ/log.$CCBB/build.log.`timestamp`

else

if ( -f "make.bin" ) then
mv make.bin make.bin.sav
endif

if ( -f "main.list" ) then
/usr/bin/mv main.list main.list.sav
grep $file_name main.list.sav >main.list
endif

/usr/local/XXXXXX/ccgnrl/v08/bin/build_topic -p -m "-k -w"

if ( -f "make.bin.sav" ) then
mv make.bin.sav make.bin
endif

if ( -f "main.list.sav" ) then
/usr/bin/mv main.list.sav main.list
endif

endif