#!/usr/bin/env bash


#  set  parameter!!!!


#Mysql
host=192.168.1.119
database=rocketmap
user=root
password=Baikal85
#Bot settings
token=857879495:AAEY_MWKEp2lmpzkzFxRb8gfV-p2RZ9_wDA
api="http://192.168.1.204:9503/api/xxx/"

#channel admin
admin=and1_89
#set config  path
path_Raid=/var/www/html/raids/
path_Rocket=/var/www/html/rocket/
path_IV=/var/www/html/iv/
##########################################################################################################################################################################################################
###dont touch ###########################################################################################################################################################################################

echo city name ?
read areaname
echo  minLat
read minLat
echo  maxLat
read maxLat
echo minLon
read minLon
echo maxLon
read maxLon
echo erstelle bot 



./new_channel.sh $areaname  Raid  $admin $api 
sleep 3
./new_channel.sh $areaname  IV  $admin $api 
sleep 3
./new_channel.sh $areaname  Rocket  $admin $api 
sleep 3

chatid_rocket=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
chatid_rocket=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
chatid_iv=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )


#Channel ID's

Raid_chatid=$chatid_rocket
Rocket_chatid=$chatid_rocket
IV_chatid=$chatid_iv

#Geo

areaname=$areaname

minLat=$minLat
maxLat=$maxLat
minLon=$minLon
maxLon=$maxLon



# generate config's file
eval "echo \" cat $musterRaid\" > ${path_raid}${areaname}.ini"
eval "echo \" cat $musterRocket\" > ${path_rocket}${areaname}.ini"
eval "echo \" cat $musterIV\" > ${path_iv}${areaname}.ini"











