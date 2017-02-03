backup(){
echo -e "\e[1;34mSelect Production or Preview to take S3 backup \e[0m"
echo "1.Production"
echo "2.Preview"
read -r -p "Enter the value as 1 or 2 to select the Production or Preview ---" response
############################################## PRODUCTION ###########################################################################
production(){
echo -e "\e[1;34m Select any one of the  Production instance like Haproxy, Hadoop, Brokers, Webservers to take S3 backup \e[0m"
echo "1.Haproxy"
echo "2.Hadoop"
echo "3.Brokers"
echo "4.Webservers"
read -r -p "Enter the value to select a particular Production Instances  ---" prod

haproxy(){
#haproxy
echo haproxy 
	#ssh -i  slabprod.pem  ubuntu@172.30.1.198 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`haproxy.zip /etc/haproxy/haproxy.cfg 
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/haproxy/files/ 
	#ENDSSH
	}

hadoop(){
#hadoop-master
echo hadoop
	#ssh -i  slabprod.pem  ubuntu@172.30.1.136 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/samza/master/files/
	#ENDSSH


#hadoop-slave1

	#ssh -i  slabprod.pem  ubuntu@172.30.1.137 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/samza/slave1/files/
	#ENDSSH

#hadoop-slave2

	#ssh -i  slabprod.pem  ubuntu@172.30.1.138 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/samza/slave2/files/
	#ENDSSH

#hadoop-slave3

	#ssh -i  slabprod.pem  ubuntu@172.30.1.78 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/samza/slave3/files/
	#ENDSSH
	}

brokers(){
echo brokers
#scalable-brokers-1

	#ssh -i  slabprod.pem  ubuntu@172.30.1.167 <<'ENDSSH'
	#sudo su -
	#mkdir /root/dump/ 
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/scalable-brokers/scalable-broker1/files/
	#ENDSSH

#scalable-brokers-2

	#ssh -i  slabprod.pem  ubuntu@172.30.1.166 <<'ENDSSH'
	#sudo su -
	#mkdir /root/dump/ 
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/scalable-brokers/scalable-broker2/files/
	#ENDSSH

#scalable-brokers-3

	#ssh -i  slabprod.pem  ubuntu@172.30.1.168 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-production-backups/scalable-brokers/scalable-broker3/files/
	#ENDSSH

	}

webservers(){
	echo "webservers"
}

case $prod in
    1) haproxy ;;
    2) hadoop ;;
    3) brokers ;;
    4) webservers ;;
    *) backup ;;
esac
read -r -p "###Are you to sure to continue to take Production backup again? [y/n]" forwardprod
case $forwardprod in
    [yY][eE][sS]|[yY]) production ;;

    *) backup ;;

esac
}
##################################################### PREVIEW #############################################################################

preview(){
echo -e "\e[1;34m Select any one of the  Preview instance like Haproxy, Hadoop, Brokers, Webservers to take S3 backup \e[0m"
echo "1.Haproxy"
echo "2.Hadoop"
echo "3.Brokers"
echo "4.Webservers"
read -r -p "Enter the value to select a particular Preview Instances  ---" prev

haproxy(){
#haproxy
echo haproxy 
	#ssh -i  slabpreview.pem  ubuntu@172.30.1.45 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`haproxy.zip /etc/haproxy/haproxy.cfg 
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/haproxy/files/ 
	#ENDSSH
	}

hadoop(){
#hadoop-master
echo hadoop
	#ssh -i  slabpreview.pem  ubuntu@172.30.1.234 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/samza/master/files/
	#ENDSSH


#hadoop-slave1

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.235 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/samza/slave1/files/
	#ENDSSH

#hadoop-slave2

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.236 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/samza/slave2/files/
	#ENDSSH

#hadoop-slave3

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.154 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`hadoop.zip /home/hadoop
	#aws s3 mv /root/dump/*.zip s3://infi-previes-backups/samza/slave3/files/
	#ENDSSH
	}

brokers(){
echo brokers
#scalable-brokers-1

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.30 <<'ENDSSH'
	#sudo su -
	#mkdir /root/dump/ 
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/scalable-brokers/scalable-broker1/files/
	#ENDSSH

#scalable-brokers-2

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.32 <<'ENDSSH'
	#sudo su -
	#mkdir /root/dump/ 
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/scalable-brokers/scalable-broker2/files/
	#ENDSSH

#scalable-brokers-3

	#ssh -i  slabpreview.pem  ubuntu@172.30.1.31 <<'ENDSSH' 
	#sudo su -
	#mkdir /root/dump/
	#zip -r /root/dump/`date +"%Y_%m_%d_%H_%M"`ubuntu.zip /home/ubuntu 
	#aws s3 mv /root/dump/*.zip s3://infi-preview-backups/scalable-brokers/scalable-broker3/files/
	#ENDSSH

	}


webservers(){
echo "webservers"
}
case $prev in
    1) haproxy ;;
    2) hadoop ;;
    3) brokers ;;
    4) webservers ;;
    *) backup ;;
esac
read -r -p "###Are you to sure to continue to take Preview backup again? [y/n]" forwardpreview
case $forwardprod in
    [yY][eE][sS]|[yY]) preview ;;

    *) backup ;;

esac

}

case $response in
    1) production ;;
    2) preview ;;
    *) exit ;;	
esac
#read -r -p "###Are you to sure to continue to take backup again? [y/n]" forward
#case $forward in
#    [yY][eE][sS]|[yY])
#       backup 
#        ;;
#    *)
#        exit
#        ;;
#esac
}
backup
