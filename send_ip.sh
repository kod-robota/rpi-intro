#/bin/bash

source ~/.botrc

my_ip=""
while [ -z $my_ip ]
do 
 my_ip=$(ip -4 -br a | grep UP | awk '{print $3}')
 sleep 1
done
echo "my data: $my_ip"

curl -X POST --data "chat_id=$chat_id" --data "text=my data: $my_ip" "https://api.telegram.org/bot$token/sendMessage"

