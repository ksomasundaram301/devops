#!/bin/bash
#bash to check ping and telnet status.
#set -x;
#
#clear
SetParam() {
export URLFILE="telnet.txt"
export TIME=`date +%d-%m-%Y_%H.%M.%S`
export port=80
export STATUS_UP=`echo -e "\E[32m[ RUNNING ]\E[0m"`
export STATUS_DOWN=`echo -e "\E[31m[ DOWN ]\E[0m"`
export MAIL_TO="ksoms301@gmail.com"
export SHELL="telnet.log"
}
Telnet_Status() {
SetParam
cat $URLFILE | while read next
do
server=`echo $next | cut -d : -f1`
port=`echo $next | awk -F":" '{print $2}'`
TELNETCOUNT=`sleep 10 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
if [ $TELNETCOUNT -eq 1 ] ; then
echo -e "$TIME : Port $port of URL http://$server:$port/ is \E[32m[ OPEN ]\E[0m";
else
echo -e "$TIME : Port $port of URL http://$server:$port/ is \E[31m[ NOT OPEN ]\E[0m";
echo -e "$TIME : Port $port of URL http://$server:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server:$port/ is DOWN!!!" $MAIL_TO;
fi
done;
}
i=1
while [ $i -le 2 ] 
do
SetParam
Telnet_Status | tee -a $SHELL
done

