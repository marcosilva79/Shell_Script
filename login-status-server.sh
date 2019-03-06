#/bin/bash
echo " "
echo " "
echo " " 
HOSTNAME=`which hostname`
#SOVERSION=`cat /etc/*release | grep PRETTY | cut -d = -f 2`
clear
echo "======================================================================================="
echo                              "System Status"
echo "======================================================================================="
echo "Operation System" `cat /etc/*release | grep PRETTY | cut -d = -f 2`

#at /etc/*release | grep PRETTY | cut -d = -f 2
echo "Kernel -version"  `uname -a | awk {'print $3'}`
echo " "
echo Servername `hostname`
echo IP Address 
ifconfig  | grep inet | grep -v inet6  | grep -v 127.0.0.1 |awk  {'print $2'}
#echo Default Gateway
#netstat -rn | grep 0.0.0.0 | grep -v 255.255.255.255 | awk {'print $2'}
echo " "
echo UPTIME
uptime
echo " " 
echo "Active Users"
w
echo " "
echo "======================================================================================="
echo "Number of vcpus"
cat /proc/cpuinfo   | grep processor  | wc -l
echo " "
echo "======================================================================================="
echo "Memory RAM Usage"
free -m
echo " "
echo "======================================================================================="
echo "Top 4 Major Processes in Memory Consumption"
 ps aux |head -1 ; ps aux | sort -nk 4 -r | head -n 5
echo "======================================================================================="
echo "Disk Usage"
df -h
echo "======================================================================================="
