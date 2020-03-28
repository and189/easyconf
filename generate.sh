#!/usr/bin/env bash


#  set  parameter!!!!


#Mysql
host=<ip>
database=<rocketmap>
user=<dbuser>
password=<dbpw>


#Bot settings
token=<bot_token>
api="<http://api_ip>"   ## "http://ip:9503/api/xxx"

#channel setting 
admin=and1_89
channel_info=RemstalmapSupoort+https://t.me/RemstalMap


#set config  path
path_Raid=/var/www/html/raids/
path_Rocket=/var/www/html/rocket/
path_IV=/var/www/html/iv/



##########################################################################################################################################################################################################
###dont touch ###########################################################################################################################################################################################

echo welche Region?
read areaname
echo  minLat?
read minLat
echo  maxLat?
read maxLat
echo minLon?
read minLon
echo maxLon?
read maxLon
echo welche fence soll iv script nutzen? 
read MeinFence
echo erstelle channels


./new_channel.sh $areaname  Raid  $admin $api $channel_info
sleep 3
./new_channel.sh $areaname  IV  $admin $api $channel_info
sleep 3
./new_channel.sh $areaname  Rocket  $admin $api $channel_info
sleep 3

chatid_rocket=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
sleep 2
chatid_rocket=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
sleep 2
chatid_iv=$(cat Raid.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
sleep 2

#Channel ID's

Raid_chatid=$chatid_rocket
Rocket_chatid=$chatid_rocket
IV_chatid=$chatid_iv

#Geo
MeinFence=$MeinFence
areaname=$areaname

minLat=$minLat
maxLat=$maxLat
minLon=$minLon
maxLon=$maxLon



# generate config's file
eval "echo \" cat $musterRaid\" > ${path_raid}${areaname}.ini"
eval "echo \" cat $musterRocket\" > ${path_rocket}${areaname}.ini"
eval "echo \" cat $musterIV\" > ${path_iv}${areaname}.ini"











