#/bin/bash


BkPATHDIR=/opt/backup/mysql/zabbix.securezone.com.br
BUCKETNAME=gs://XXXXXXX-XXXXXXX/Backup-Zabbix-Mysql/
DATABASENAME=zabbix
USERDB=zabbix
PASSW=XXXXXXXXX
DATA=`date +%d-%m-%Y`

mysqldump -u $USERDB -p --databases $DATABASENAME | gzip > $BkPATHDIR/$DATABASENAME-$DATA.sql.gz

gsutil cp -r $BkPATHDIR  $BUCKETNAME 

find $BkPATHDIR -mtime +3 -print -exec rm -rf {} \;

