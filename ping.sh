#!/bin/bash
#bash to check ping and telnet status.
#set -x;
#clear
SetParam() {
export URLFILE="Host_PortFile.txt"
export TIME=`date +%d-%m-%Y_%H.%M.%S`
export STATUS_UP=`echo -e "\E[32m[ RUNNING ]\E[0m"`
export STATUS_DOWN=`echo -e "\E[31m[ DOWN ]\E[0m"`
export MAIL_TO="ksoms301@gmail.com"
export SHELL_LOG="ping.log"
}

Ping_Hosts() {
SetParam
cat $URLFILE | while read next
do
#echo $count
server=`echo $next | cut -d : -f1`
echo $next
ping -i 2 -c 6 $server > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "$TIME : Status Of Host $server = $STATUS_UP";
else
echo "$TIME : Status Of Host $server = $STATUS_DOWN";
echo "$TIME : Status Of Host $server = $STATUS_DOWN" | mailx -s "$server Host DOWN!!!" $MAIL_TO
fi
done;
}
i=1
while [ $i -le 2 ] 
do
SetParam
Ping_Hosts | tee -a $SHELL_LOG
done

