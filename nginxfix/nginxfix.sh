#!/bin/bash
case $1 in
stop )
pid=$(ps -ef|grep /root/nginxfix|awk -F ' ' 'NR==1 {print $2}')
kill $pid
;;
restart )
pid=$(ps -ef|grep /root/nginxfix|awk -F ' ' 'NR==1 {print $2}')
kill $pid
bash /root/nginxfix &
;;
*)

t=1
while [ $t -eq 1 ]
do
mailaddr="ghjk1547@163.com"
c=$(ps -ef|grep 'nginx: master process' -c)
if [ $c -eq 1 ]
then
service nginx restart
d=$(ps -ef|grep 'nginx: master process' -c)
if [ $d -ne 1 ]
then
    echo -e "Service restart success.">tmp.log
    status=$(curl http://localhost/ -s -w %{http_code}|awk -F ' ' 'END {print $1}')
    if [ $status -eq 200 ]
    then
        echo -e "Server works correctly.">>tmp.log
    else
        echo -e "Pages open incorrect.\nThe status: $status">>tmp.log
        echo -e "To: $mailaddr\nSubject: Nginx report\n">mail.txt
        echo -e "Nginx restart success.But the localhost page can not be opened correctly.Please deal whit it if you get this mail.\nHere is the report:">>mail.txt
        cat tmp.log>>mail.txt
        echo -e "\n">>mail.txt
        mail -t<mail.txt
        #send mail to administrator.
        #<From:CentOS 7>
        #<Time:xxxx.xx.xx,xx:xx>
        #The Nginx server can not work correctly.
        echo "Mail has sent."
    fi
else    
    echo -e "Service restart failed.">tmp.log
    echo -e "Server status(use systemctl):">>tmp.log
    systemctl status nginx.service>>tmp.log
    echo -e "To: $mailaddr\nSubject: Nginx report\n">mail.txt
    echo -e "Nginx restart failed.Please deal whit it if you get this mail.\nHere is the report:">>mail.txt
    cat tmp.log>>mail.txt
    echo -e "\n">>mail.txt
    mail -t<mail.txt
    #send mail to administrator.
    #mail format:
    #To: xxx@xxx(Mail header lines)
    #Subject: xxxxx
    #(Content)
    #(Need to have
    # two blank lines)
    echo "Mail has sent."
fi
fi
sleep 60
done

;;
esac