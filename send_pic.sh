#!/bin/bash
chat_id="476691449"
chat_id="499105844"
token="5547185149:AAEBcvdJBGTsKT7QuYjODp1T0f6YiefG7Do"
#token="5547185149:AAEwdOAD-pSAvNwcjsl4Km_pwEcwN1c9DdY"
date=`date +'%d%m%Y-%H:%M'`
pic=pic${date}.jpg
pica=pic${date}a.jpg

a_opts=$((1024+12))

#128,0x108080,0xD21092

#if raspistill -ae 128 --annotate $a_opts -o "$pic" >pic.log 2>&1; then
#if raspistill -n -o "$pic" >pic.log 2>&1; then
if libcamera-jpeg -o "$pic" >pic.log 2>&1; then
  convert $pic  -background White  -fill Black  -pointsize 128 -gravity NorthEast -annotate +10+10 "$date" $pica
  curl https://api.telegram.org/bot$token/sendphoto -F chat_id=$chat_id -F photo=@$pica
else
  curl -X POST --data "chat_id=$chat_id" --data "text=can not take pic: $log" "https://api.telegram.org/bot$token/sendMessage"
fi

