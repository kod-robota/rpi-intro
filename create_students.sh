#!/bin/bash

for line in `cat $1`; do
arr_line=(${line//:/ })
user=${arr_line[0]}
pass=${arr_line[1]}
echo USER $user PASS $pass
sudo /usr/sbin/userdel $user
sudo /usr/sbin/useradd -m -s /bin/bash $user #-p $(openssl passwd -crypt $pass) $user
echo $line | sudo chpasswd
#echo $pass | sudo /usr/bin/passwd $user --stdin
done
