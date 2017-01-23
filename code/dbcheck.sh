#!/bin/bash
db_status() {
stat="Can't connect"
dbstatus=`mysqlcheck -c infidb -h 172.30.1.159 -P 3306  --user='infiuser' --password='Inf1Sw1ft$User' | grep -v "$stat" | grep 'OrganizationApp.PRIMARY' | wc -l`
if [ $dbstatus -eq 1 ] ; then
echo "MEMSQL CONNECTED"
else
echo "MEMSQL $stat " | mutt -s "$(date +"%F_%T") Memsql Disconnected" -- ksoms301@gmail.com
fi
}
i=1
while [ $i -le 2 ] 
do
db_status
sleep 10m
done




sudo ssh -o StrictHostKeyChecking=no -i Broker1.pem ubuntu@172.30.1.11 'mysqlcheck -c infidb -h 172.30.1.11 -P 3306 --user='root' --password='''



IP                   : 52.91.114.249

Port              : 22

UserName   : root

Password    :  9pG/JQxQA9QW
