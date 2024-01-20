#!/bin/bash
#tested on docker zabbix/grafana
IPERFS=landau.server                        
portMin=5200                                
portMax=5209                                
bolDownload=0                               
bolUpload=0                                 
log=/home/home/bakhti/logs.txt              
speedlog=/home/bakhti/iperf3.txt             
parallel=3                                  
SERV=172.12.0.2                          
PORT=10051                               
HOST='xyz'                                     
SITEMDOWN=xyz.iperf3.speedtest.down      
SITEMUP=xyz.iperf3.speedtest.up          

set -o pipefail

while [ $bolDownload == 0 -o $bolUpload == 0 ]
do
        if [ $portMin -le $portMax ] 
        then              
                if [ $bolDownload -eq 0 ]
                then
                        DLOAD=`/usr/bin/iperf3 -f m -c $IPERFS -p $portMin -R -P $parallel |grep sender |grep SUM |awk -F " " '{print $6}'`
                        if [ "$?" -ne "0" ]; then
                                
                                echo "$(date +%x_%T)" >> $log
                        else
                              
                                bolDownload=1
                        fi
                fi
               
                if [ $bolUpload -eq 0 ]
                then
                        ULOAD=`/usr/bin/iperf3 -f m -c $IPERFS -p $portMin -P $parallel |grep sender |grep SUM |awk -F " " '{print $6}'`
                        if [ "$?" -ne "0" ]; then
                                echo "$(date +%x_%T)"  >> $log
                        else
                                bolUpload=1
                        fi
                fi
                if [ $bolDownload == 0 -o $bolUpload == 0 ]; then
                        let portMin=$portMin+1
                fi
        else
                break
        fi done

if [ $bolDownload == 1 -a $bolUpload == 1 ]
 then
        echo "$(date +%x_%T)" Server:$IPERFS"   "Port:$portMin" "Download="     "$DLOAD"        "Upload="       "$ULOAD >> $speedlog
fi

if [ $bolDownload == 1 ]
 then
        /usr/bin/zabbix_sender -z "$SERV" -p "$PORT" -s "$HOST" -k "$SITEMDOWN" -o $DLOAD
fi


if [ $bolUpload == 1 ]
 then
        /usr/bin/zabbix_sender -z "$SERV" -p "$PORT" -s "$THOST" -k "$SITEMUP" -o $ULOAD
fi
