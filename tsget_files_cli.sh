#!/usr/local/bin/tcsh
##################################################################################################
# This script will use Team System's "tf get" command to get files which are not up to date 
# in the current workspace.
# The files are in a specific version in a specific bb.
# To Be used form Jenkins consol
# Usage: tsget_files_cli <file_name> <version> <topic> <bb>
##################################################################################################

if ($#argv != 4) then
	echo " Usage: tsget_files_cli <file_name> <version> <topic> <bb>      "
	exit
else
	set file = $1
	set ver = $2
	set topic = $3
	set bb = $4
endif

#source $CMDIR/etc/set_params.tcsh
#source $CMDIR/etc/set_ts_params.tcsh
setenv CCMNGRHOME "/usr/local/ccmngr"
source /clchome/clc/ccclc/mb_ccclc/.ccmngr_login
source /usr/local/CM/etc/set_params.tcsh
source /usr/local/CM/etc/set_ts_params.tcsh


set progname = tsget_files 
set extntion=`echo $file | awk -F. '{print $2}'`
if ($extntion == rql) then
	echo " ****************     Refresh is not allowd for file type: """rql""" **************** "
	exit 1

endif

echo "\n*** REFRESHING FILES BEFORE MANUAL BUILD ***\n" 


if ($bb != "XXXXXX" && $bb != "XXXXXXXX" && $bb != "XXXXXXXX") then
	set vname = "v`echo $ver | cut -c1,2`_`echo $ver | cut -c3`"
else
	set vname = "v08_5_`echo $ver`"
endif





	echo "\nYou chose to refresh the following files under ${bb}/${vname}/${topic}:\n"
	echo ${file} | tr ' ' '\n'
	if ($topic != "") then
		echo "\nYou chose to refresh all the not up to date files under ${bb}/${vname}/${topic}."
	else
		echo "\nYou chose to refresh all the not up to date files under ${bb}/${vname}."
	endif

echo "\nPreview of the files that will be refreshed from source control...\n"
echo "Preview file: " $file 
if ($bb != "XXXXXX" && $bb != "XXXXXX" && $topic != "XXX" && $topic != "shr") then
	${TFDIR}/tf get -preview ${HOME}/bb/$bb/$vname/$topic/src/$file -login:${tslogin} 
	${TFDIR}/tf get -preview ${HOME}/bb/$bb/$vname/$topic/inc/$file -login:${tslogin} 
else
	${TFDIR}/tf get -preview ${HOME}/bb/$bb/$vname/$topic/$file -login:${tslogin} 
endif

echo "\nGetting files from source control...\n"
echo "Geting file: " $file 
if ($bb != "XXXXXX" && $bb != "XXXXXX" && $topic != "XXX" && $topic != "shr") then
	${TFDIR}/tf get ${HOME}/bb/$bb/$vname/$topic/src/$file -login:${tslogin} 
	${TFDIR}/tf get ${HOME}/bb/$bb/$vname/$topic/inc/$file -login:${tslogin} 
else
	${TFDIR}/tf get ${HOME}/bb/$bb/$vname/$topic/$file -login:${tslogin} 
endif
