#!/bin/bash


#### new_channel.sh / arename/  modus /  admin without @ /api


areaname=$1
modus=$2
admin=$3
api=$4
channelinfo=$5
channel="$areaname+$modus" 
channel_info="$channelinfo"  
linkapi=$api"channels.createChannel?data[broadcast]=0&data[title]=$channel&data[about]=$channel_info"
link=$linkapi

sudo wget -O ${modus}.txt $link
channelid=$(cat ${modus}.txt | grep  channel_id |awk -F ": "'|'","'' '{ print $2 }' | uniq )
linkapi2=$api"channels.editAdmin?data%5Bchannel%5D=-100$channelid&data%5Buser_id%5D=%40$admin&data%5Badmin_rights%5D%5B_%5D=chatAdminRights&data%5Badmin_rights%5D%5Bchange_info%5D=1&data%5Badmin_rights%5D%5Bpost_messages%5D=1&data%5Badmin_rights%5D%5Bedit_messages%5D=1&data%5Badmin_rights%5D%5Bdelete_messages%5D=1&data%5Badmin_rights%5D%5Bban_users%5D=1&data%5Badmin_rights%5D%5Binvite_users%5D=1&data%5Badmin_rights%5D%5Bpin_messages%5D=1&data%5Badmin_rights%5D%5Badd_admins%5D=1
sudo wget -O /var/www/html/raid_bot/jsonnew_channel.txt $linkapi2


