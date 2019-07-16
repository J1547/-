#!/bin/bash
mailaddr='ghjk1547@163.com'
case $1 in
stop)
pid=$(ps -ef|grep /root/cmdcheck|awk 'NR==1{print$2}')
kill $pid
;;
restart)
pid=$(ps -ef|grep /root/cmdcheck|awk 'NR==1{print$2}')
kill $pid
bash /root/cmdcheck/cmdcheck.sh &
;;
*)
#Cpu part start
tmp=1
while [ $tmp -eq 1 ]
do
count=0
i=0
sum=0
while [ $i -lt 3 ]
do
cpu=`top -bin 1|awk 'NR==3{print $2}'|awk -F '.' '{print $1}'`
if [ $cpu -gt 80 ]
then
let sum=sum+1
fi
let i=i+1
sleep 3
done

if [ $sum -lt 3 ]
then
c='great'
else

c='overused'
let count=count+1
fi
#Cpu part end

#Mem part start
i=0
sum=0
while [ $i -lt 3 ]
do
mem=`free|awk 'NR==2{print $2}'`
used=`free|awk 'NR==2{print $3}'`
perc=`echo "scale=2;$used/$mem"|bc|awk -F '.' '{print$2}'`
if [ $perc -gt 80 ]
then
let sum=sum+1
fi
let i=i+1
sleep 3
done

if [ $sum -lt 3 ]
then
m='great'
else
m='overused'
let count=count+1
fi
#Mem part end

#Disk part start
i=0
for var in `df|awk 'NR!=1{print $5}'|awk -F '%' '{print $1}'`
do
if [ $var -gt 80 ]
then
let i=i+1
fi
done

if [ $i -eq 0 ]
then
d='avaliable'
else
d='full'
let count=count+1
fi
#Disk part end

#Mail part start
if [ $count -ne 0 ]
then
echo -e "To: $mailaddr\nSubject:System Status\n">mail.log
echo -e "Cpu status:$c">>mail.log
#echo -e "Cpu used(top):`top -n 1|grep Cpu|awk '{print $2}'`">>mail.log
top -ibn 1|awk 'NR!=7{print}'>>mail.log
echo -e "Mem status(free):$m">>mail.log
free>>mail.log
echo -e "\nDisk status(df):$d">>mail.log
df>>mail.log
echo -e "\n\n">>mail.log
sleep 3
mail -t<mail.log
echo -e "Cpu,Mem and Disk have problem,mail has sent."
fi
#Mail part end

sleep 300
done

;;
esac