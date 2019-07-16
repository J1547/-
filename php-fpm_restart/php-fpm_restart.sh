num=$(ps -ef|grep php-fpm|grep pool -c)
if [ $num -gt 5 ]
then
    echo -e "Pool is too much,service will be restarted."
    if service php-fpm restart
    then
        echo -e "php-fpm restart success."
    else
        echo -e "php-fpm restart failed."
        echo -e "To: ghjk1547@163.com\nSubject: php-fpm report">pmail.txt
        echo -e "The php-fpm service restart failed.Please deal whit it if you get this mail.">>pmail.txt
        echo -e "Service status:"
        systemctl status php-fpm.service>>pmail.txt
        echo -e "\n">>pmail.txt
        mail -t<pmail.txt
        echo -e "Mail has sent."
    fi
elif [ $num -eq 0 ]
then
    echo -e "php-fpm does not start,service will be started now."
    if service php-fpm start
    then
    echo -e "php-fpm start success."
    else
        echo -e "php-fpm restart failed."
        echo -e "To: ghjk1547@163.com\nSubject: php-fpm report">pmail.txt
        echo -e "The php-fpm service start failed.Please deal whit it if you get this mail.">>pmail.txt
        echo -e "Service status:"
        systemctl status php-fpm.service>>pmail.txt
        echo -e "\n">>pmail.txt
        mail -t<pmail.txt
        echo -e "Mail has sent."
    fi
fi      
