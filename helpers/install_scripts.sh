#!/bin/bash

BASE=$(dirname $(dirname $0))

echo $BASE
if [ ! -d /opt/nginx-manager ]; then
	mkdir -p /opt/nginx-manager
	echo "Created /opt/nginx-manager."
else
	echo "/opt/nginx-manager already exists."
fi

if [ ! -d /opt/nginx-manager/bin ]; then
	mkdir -p /opt/nginx-manager/bin
	echo "Created /opt/nginx-manager/bin."
else
	echo "/opt/nginx-manager/bin already exists."
fi

echo "Copying bin files."
cp -f $BASE/bin/* /opt/nginx-manager/bin

echo "Creating synlinks to bin files."
ln -fs /opt/nginx-manager/bin/delaccount /usr/sbin/delaccount
ln -fs /opt/nginx-manager/bin/delredirect /usr/sbin/delredirect
ln -fs /opt/nginx-manager/bin/delsite /usr/sbin/delsite
ln -fs /opt/nginx-manager/bin/newaccount /usr/sbin/newaccount
ln -fs /opt/nginx-manager/bin/newdomainkit /usr/sbin/newdomainkit
ln -fs /opt/nginx-manager/bin/newnet2ftp /usr/sbin/newnet2ftp
ln -fs /opt/nginx-manager/bin/newphpmyadmin /usr/sbin/newphpmyadmin
ln -fs /opt/nginx-manager/bin/newredirect /usr/sbin/newredirect
ln -fs /opt/nginx-manager/bin/newsite /usr/sbin/newsite
ln -fs /opt/nginx-manager/bin/newgmail /usr/sbin/newgmail
ln -fs /opt/nginx-manager/bin/newgdocs /usr/sbin/newgdocs
ln -fs /opt/nginx-manager/bin/newgcalendar /usr/sbin/newgcalendar
ln -fs /opt/nginx-manager/bin/newgapps /usr/sbin/newgapps

echo "Install successful."
