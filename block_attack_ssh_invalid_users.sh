#!/bin/bash

cat /var/log/secure | grep "Invalid user" | awk {'print $10'} | uniq > /tmp/bloquear_ip_txt
for x in $(cat /tmp/bloquear_ip_txt | uniq); do iptables -A INPUT -s $x -p tcp --dport 22 -j DROP ; done
for x in $(cat /tmp/bloquear_ip_txt | uniq); do echo  ALL:$x >> /etc/hosts.deny ; done
echo " " > /tmp/bloquear_ip_txt
echo " " > /var/log/secure
echo "Reiniciado Rsyslog ..."
# Apos "zerar" arquivo de log é necessário reinicializar rsyslog para o servico voltar a gravar no log apagado.
/etc/init.d/rsyslog restart

