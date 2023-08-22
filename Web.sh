#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/tmp
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

# installing inginx


yum install nginx -y &>> $LOGFILE

VALIDATE $? "Installed ngix"

systemctl enable nginx &>> $LOGFILE

VALIDATE $? "enabled ngnix"

systemctl start nginx &>> $LOGFILE

VALIDATE $? "Started ngnix"

rm -rf /usr/share/nginx/html/* &>> $LOGFILE

VALIDATE $? "Remove the default content that web server is serving"

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>> $LOGFILE

VALIDATE $? "Download the frontend content"

cd /usr/share/nginx/html &>> $LOGFILE

VALIDATE $? "Extract the frontend content"

unzip /tmp/web.zip &>> $LOGFILE

VALIDATE $? "unzip file"

cp roboshop.repo /etc/nginx/default.d/roboshop.conf &>> $LOGFILE

VALIDATE $? "copy roboshop.conf file"

systemctl restart nginx &>> $LOGFILE

VALIDATE $? "restart nginx"
