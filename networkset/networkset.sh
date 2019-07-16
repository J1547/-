#!/bin/bash
export RED_COLOR="\E[1;31m"    #set global value
export GREEN_COLOR="\E[1;32m"
export RES="\E[0m"

read -p "change to static or dhcp(s/d)" an

case $an in
s)
type=`cat /etc/sysconfig/network-scripts/ifcfg-ens33|grep BOOTPROTO|awk -F '"' '{print$2}'`
if [ $type=="dhcp" ]
then
cat /etc/sysconfig/network-scripts/ens33-static.bak>/etc/sysconfig/network-scripts/ifcfg-ens33
if (ping localhost -c 4)
then
echo -e "${GREEN_COLOR}success${RES}"
else
echo -e "${RED_COLOR}failed${RES}"
fi
echo "exit"
else
echo "already static type, exit"
fi
;;
d)
type=`cat /etc/sysconfig/network-scripts/ifcfg-ens33|grep BOOTPROTO|awk -F '"' '{print$2}'`
if [ $type=="dhcp" ]
then
echo "already dhcp type, exit"
else
cat /etc/sysconfig/network-scripts/ens33-dhcp.bak>/etc/sysconfig/network-scripts/ifcfg-ens33
if (ping localhost -c 4)
then
echo -e "${GREEN_COLOR}success${RES}"
else
echo -e "${RED_COLOR}failed${RES}"
fi
echo "exit"
fi
;;
*)
echo "nothing to do, exit."
;;
esac