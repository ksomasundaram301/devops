#!/bin/bash
#bash to check ping and telnet status.
#set -x;
#clear
SetParam() {
export URLFILE_INFI="host.txt"
export TIME_INFI=`date +%F_%T:%3N`
export STATUS_UP_INFI=`echo -e "\E[32m[ RUNNING ]\E[0m"`
export STATUS_DOWN_INFI=`echo -e "\E[31m[ DOWN ]\E[0m"`
export MAIL_TO_INFI="ksoms301@gmail.com"
export PING_LOG_INFI="ping.log"
}

Ping_Hosts() {
SetParam
cat $URLFILE_INFI | while read next
do
server=`echo $next | cut -d : -f1`
ping -i 2-c 2$server > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "$TIME_INFI : Status Of Host $server = $STATUS_UP_INFI";
else
echo "$TIME_INFI : Status Of Host $server = $STATUS_DOWN_INFI";
echo "$TIME_INFI : Status Of Host $server = $STATUS_DOWN_INFI" | mutt -s "$server Host DOWN!!!" $MAIL_TO_INFI
fi
done;
}
i=1
while [ $i -le 2 ] 
do
SetParam
Ping_Hosts | tee -a /var/log/$PING_LOG_INFI
done

