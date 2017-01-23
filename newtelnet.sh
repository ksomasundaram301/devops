#!/bin/bash
SetParam() {
export INFI_URLFILE="host.txt"                                #text file for hostname and port entry
export INFI_TIME=`date +%F_%T:%3N`                              #time stamp
export INFI_TELNET_LOG="telnet.log"                             # log file for telnet
}

Log_infiCore() {                                                #function for ssh and mail

ssh -i Broker1.pem ubuntu@$server <<'ENDSSH'
 TMEPDIR="/tmp/mqtt-crash"                                      
 MQTTDIR="/var/log/mqtt-broker"
         if [[ ! -e $TMEPDIR ]]; then
                 mkdir $TMEPDIR
         fi

        sudo find $MQTTDIR -mtime 0 -type f 2>/dev/null |sort | tail -1 | xargs sudo cp -t $TMEPDIR/
        PRO_PID=`sudo ps aux | echo $(pgrep -d',' -f infi)`

        if [ $PRO_PID == 0 ]; then                                                                              #checking core infi --- process id
                INFI_STATUS=ls -l /tmp | grep core | awk '{print $7 $6 $8}'
                STAT=$INFI_STATUS*Core-Dump last rotate'infi-dead'
                cp /tmp/core.* $TMEPDIR/        
        else
                sudo gcore -o $TMEPDIR/core-$(date +"%d-%m-%Y") $PRO_PID
                sudo cp /usr/local/sbin/infi $TMEPDIR/.
                STAT='infi-running'
        fi
#       sudo cp /var/log/ping.log /tmp/mqtt-crash
        sudo zip -r $TMEPDIR-$(date +"%d-%m-%Y").zip $TMEPDIR                                                   #create zip file with time stamp
#       sudo service postfix start
        sudo echo "[ $(hostname) ]-MQTT_Scalable Brokers doesn't connect in HAProxy by Telnet" | sudo mutt -a "/tmp/mqtt-crash-$(date +"%d-%m-%Y").zip" -s "INFI-Scalable Brokers Reports[$STAT]" -- ksoms301@gmail.com
        sudo sleep 10   
        sudo rm -rf /tmp/mqtt-crash-$(date +"%d-%m-%Y").zip
#       sudo service postfix stop
                                                                                               1,1           Top
        
ENDSSH

}

Telnet_Status() {

SetParam
cat $INFI_URLFILE | while read next                     #read input from telnet.txt
do
        server=`echo $next | cut -d : -f1`
        port=`echo $next | awk -F":" '{print $2}'`
        TELNETCOUNT=`sleep 30 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`

        if [ $TELNETCOUNT -eq 1 ] ; then
                echo -e "$INFI_TIME : Port $port of URL http://$server:$port/ is \E[32m[ OPEN ]\E[0m";
        else
                echo -e "$INFI_TIME : Port $port of URL http://$server:$port/ is \E[31m[ NOT OPEN ]\E[0m";       #calling Log_infiCore
                Log_infiCore
		sleep 15m
        fi
done;
}

i=1
while [ $i -le 2 ] 
do
        SetParam                                                        #continuous rotate for checking telnet for every 10 seconds
        Telnet_Status | tee -a /var/log/$INFI_TELNET_LOG

done

