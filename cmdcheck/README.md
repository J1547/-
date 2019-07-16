这里是监控cpu，内存和磁盘状况的脚本，我写成了服务的形式
名字就叫cmdchheck,意思是cpu，memery,disk check
默认放在/root下，service文件放在/etc/systemd/system下
脚本文件一个，mail.log是发送的邮件文本，由脚本自行生成，记得修改管理员的邮件地址
脚本的运行分三部分，对cpu，内存和磁盘的使用量进行监控，达到额值会向管理员发送邮件报警
