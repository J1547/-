#!/bin/bash
mailaddr=''
case $1 in
stop)
pid=$(ps -ef|grep /root/sys-secure|awk -F ' ' 'NR==1 {print $2}')
kill $pid
;;
restart)
pid=$(ps -ef|grep /root/sys-secure|awk -F ' ' 'NR==1 {print $2}')
kill $pid
bash /root/sys-secure/sys-secure.sh &
;;
*)
t=1
while [ $t -eq 1 ]
do
count=0
if [ `history|awk 'END{print NR}'` -lt 20 ]
then
	echo "history in bash is too little"
	count=1
fi
sed2=`history|grep "sed -i" -c`
proc2=`history|grep "/proc" -c`
vi2=`history|grep "vi " -c`
sed1=`cat /root/.bash_history|grep "sed -i" -c`
proc1=`cat /root/.bash_history|grep "/proc" -c`
vi1=`cat /root/.bash_history|grep "vi " -c`
if [ $sed1 -eq 0 ]&&[ $proc1 -eq 0 ]&&[ $vi1 -eq 0 ]&&[ $sed2 -eq 0 ]&&[ $proc2 -eq 0 ]&&[ $vi2 -eq 0 ]
then
	echo "No Suspicious command."
else
	echo "There may be Suspicious command.Mail has sent."
	echo -e "To: $mailaddr\nSubject: Suspicious command\n">secure.log
	echo "The suspicious history:">>secure.log
	if [ $count -eq 0 ]
	then
		history>>secure.log
		cat /root/.bash_history|grep "sed -i">>secure.log
		cat /root/.bash_history|grep "/proc">>secure.log
		cat /root/.bash_history|grep "vi ">>secure.log
	else
		history|grep "sed -i">>secure.log
		history|grep "/proc">>secure.log
		history|grep "vi ">>secure.log
		cat /root/.bash_history|grep "sed -i">>secure.log
		cat /root/.bash_history|grep "/proc">>secure.log
		cat /root/.bash_history|grep "vi ">>secure.log
	fi
	echo -e "\n\n">>secure.log
	mail -t<secure.log
fi
sleep 3600
done
;;
esac
