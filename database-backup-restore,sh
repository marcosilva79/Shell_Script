#!/bin/bash 
x="Digite Opção Desejada"
menu ()
{
while true $x != "Digite Opção Desejada"
do
clear
echo "================================================"
echo "Menu de Rotinas de Backup-Restore MySQL e MariaDB"
echo "Criado por: Marco Aurelio da Silva"
echo ""
echo "1)Backup Database"
echo""
echo "2)Restore Database"
echo""
echo "3)Sair do programa"
echo ""
echo "================================================"
echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in
    1)
ARQ="/var/log/backup"
FILE="backup-database.log"
data=`date +%d-%m-%Y`
DIRCOPY="/opt/BACKUP/base"

   if [ -e "$ARQ/$FILE" ] ; then
  sleep 0
   else
  mkdir -p $ARQ
  cd $ARQ && touch $FILE
  echo "o arquivo de log nao existia e foi criado" >> /$ARQ/$FILE
   fi

   if [ -d "$DIRCOPY" ] ; then
  sleep 0
   else
  echo "o diretorio de log nao existe e sera criado"
  mkdir -p $DIRCOPY
   fi
   
# Database 1 - Variáveis da Base Local

# Nome do host
host="localhost"
# Informacao do Usuario
user="admin"
# Informacao da Senha
password="XXXXXXXXXXX"
# Informacao database name
dbname="XXXXXXXX"
DIRCOPY="/opt/BACKUP/base"
# Executando dump
mysqldump -u $user -p$password --databases $dbname > $dircopy/$dbname-$data.sql
   sleep 0
exit
;;

    2)
ARQ="/var/log/backup"
FILE="backup-database.log"
# Nome do host
host="localhost"
# Informacao do Usuario
user="XXXXXXXXX"
# Informacao da Senha
password="XXXXXXXXXXX"
DIRCOPY="/opt/BACKUP/base"

   if [ -e "$ARQ/$FILE" ] ; then
  sleep 0
   else
  mkdir -p $ARQ
  cd $ARQ && touch $FILE
  echo "o arquivo de log nao existia e foi criado" >> /$ARQ/$FILE
   fi

# Informacao database name
echo -n "Digite nome database a ser restaurado o dump ?"
read dbname
ls -1 $DIRCOPY 
echo -n "Copie e Cole Versao a ser restaurada"
# Informe versao do dump a ser restaurado
read dumpname
mysql -u$user -h$host -p$password $1 $dbname < $DIRCOPY/$dumpname
   sleep 0
    exit
    ;;

  3)
sleep 0
exit
;;

*)
   echo "Opção inválida!"
esac
done

}
menu
