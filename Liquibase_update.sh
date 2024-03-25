#!/bin/bash
### general variables
csv_file=$1
path_work_dir=$2
### XXXX_XX variables
user_name_XXXX_XX=$3
psw_XXXX_XX=$4
dwh_server_XXXX_XX=$5
port_XXXX_XX=$6
dwh_sid_XXXX_XX=$7
### XXXX_XXX variables
user_name_XXXX_XXX=$8
psw_XXXX_XXX=$9
dwh_server_XXXX_XXX=${10}
port_XXXX_XXX=${11}
dwh_sid_XXXX_XXX=${12}
### XX_XXXXX variables
user_name_XX_XXXXX=${13}
psw_XX_XXXXX=${14}
dwh_server_XX_XXXXX=${15}
port_XX_XXXXX=${16}
dwh_sid_XX_XXXXX=${17}
### XX variables
user_name_XX=${18}
psw_XX=${19}
dwh_server_XX=${20}
port_XX=${21}
dwh_sid_XX=${22}
### XXXXXX_XXX variables
psw_XXXXXX_XXX=${23}
port_XXXXXX_XXX=${24}
dwh_server_XXXXXX_XXX=${25}
dwh_sid_XXXXXX_XXX=${26}
user_name_XXXXXX_XXX=${27}
### XXXXXXX variables
psw_XXXXXXX=${28}
port_XXXXXXX=${29}
dwh_server_XXXXXXX=${30}
dwh_sid_XXXXXXX=${31}
user_name_XXXXXXX=${32}
csv_file_full_path=$path_work_dir/_BIDB/Config/$csv_file
cd $path_work_dir
while read line
do
   IFS="," read -r Quarter_Year Assignmet_Num Sub_Product <<< $line
   echo $Quarter_Year
   echo $Assignmet_Num
   echo $Sub_Product
   if [ "$Sub_Product" = "XXXX_XX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XXXX_XX -v PS=$psw_XXXX_XX -v DWS=$dwh_server_XXXX_XX -v PRT=$port_XXXX_XX -v SID=$dwh_sid_XXXX_XX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XXXX_XX -v PS=$psw_XXXX_XX -v DWS=$dwh_server_XXXX_XX -v PRT=$port_XXXX_XX -v SID=$dwh_sid_XXXX_XX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following parameters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   elif [ "$Sub_Product" = "XX_XXXXX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XX_XXXXX -v PS=$psw_XX_XXXXX -v DWS=$dwh_server_XX_XXXXX -v PRT=$port_XX_XXXXX -v SID=$dwh_sid_XX_XXXXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XX_XXXXX -v PS=$psw_XX_XXXXX -v DWS=$dwh_server_XX_XXXXX -v PRT=$port_XX_XXXXX -v SID=$dwh_sid_XX_XXXXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following parameters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   elif [ "$Sub_Product" = "XXXX_XXX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XXXX_XXX -v PS=$psw_XXXX_XXX -v DWS=$dwh_server_XXXX_XXX -v PRT=$port_XXXX_XXX -v SID=$dwh_sid_XXXX_XXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XXXX_XXX -v PS=$psw_XXXX_XXX -v DWS=$dwh_server_XXXX_XXX -v PRT=$port_XXXX_XXX -v SID=$dwh_sid_XXXX_XXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following parameters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   elif [ "$Sub_Product" = "XX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XX -v PS=$psw_XX -v DWS=$dwh_server_XX -v PRT=$port_XX -v SID=$dwh_sid_XX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:%s:****:%s --changeLogFile=_BIDB/***/%s/%s/config.xm  --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XX -v PS=$psw_XX -v DWS=$dwh_server_XX -v PRT=$port_XX -v SID=$dwh_sid_XX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xm  --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following permeters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   elif [ "$Sub_Product" = "XXXXXX_XXX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XXXXXX_XXX -v PS=$psw_XXXXXX_XXX -v DWS=$dwh_server_XXXXXX_XXX -v PRT=$port_XXXXXX_XXX -v SID=$dwh_sid_XXXXXX_XXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XXXXXX_XXX -v PS=$psw_XXXXXX_XXX -v DWS=$dwh_server_XXXXXX_XXX -v PRT=$port_XXXXXX_XXX -v SID=$dwh_sid_XXXXXX_XXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following parameters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   elif [ "$Sub_Product" = "XXXXXXX" ]
   then
     echo ------  Deployed Command:  ------
     echo "" | awk -v UN=$user_name_XXXXXXX -v PS=$psw_XXXXXXX -v DWS=$dwh_server_XXXXXXX -v PRT=$port_XXXXXXX -v SID=$dwh_sid_XXXXXXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=*** --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,DWS,PRT,SID,QY,AN,SP)}'
     echo "" | awk -v UN=$user_name_XXXXXXX -v PS=$psw_XXXXXXX -v DWS=$dwh_server_XXXXXXX -v PRT=$port_XXXXXXX -v SID=$dwh_sid_XXXXXXX -v QY=$Quarter_Year -v AN=$Assignmet_Num -v SP=$Sub_Product '{prinXX("\n/usr/local/liquibase-4.1.1/liquibase --username=%s --password=%s --url=jdbc:oracle:thin:@%s:%s:%s --changeLogFile=_BIDB/%s/%s/%s/config.xml --classpath=/usr/local/liquibase-4.1.1/lib/orai18n.jar  update\n\n", UN,PS,DWS,PRT,SID,QY,AN,SP)}'    | sh
retVal=$?
if [ $retVal != 0 ] 
then
    echo "Failed on the following parameters: $Quarter_Year $Assignmet_Num $Sub_Product"
    exit 1
fi
   else
     echo "Failed on the following permeters: $Quarter_Year $Assignmet_Num $Sub_Product"
   fi
echo "    ........................   "
done < <(tail -n +2 $csv_file_full_path)
#done < $csv_file_full_path