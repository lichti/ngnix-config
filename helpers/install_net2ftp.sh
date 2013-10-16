#!/bin/bash 

FILE="net2ftp_v1.0.zip"
URL="http://www.net2ftp.com/download/net2ftp_v1.0.zip"
TMP=/tmp
DST=/usr/local/share
DIR1=net2ftp_v1.0
DIR2=net2ftp

wget -c $URL -O $TMP/$FILE

if [ ! -d $DST ]; then
	mkdir -p $DST
fi

if [ -d $DST/$DIR2 ];then
	rm -rf $DST/$DIR2
fi

cd $TMP
unzip $FILE
rm -rf $DILE
mkdir $DST/$DIR2
mv $TMP/$DIR1/files_to_upload/* $DST/$DIR2/
rm -rf $TMP/$DIR1
chmod 777 $DST/$DIR2/temp

cd -

cat << EOF >> /$DST/$DIR2/settings.inc.php
<?php
\$net2ftp_settings["email_feedback"] = "gustavo@apensystem.com";
\$net2ftp_settings["default_language"] = "en";
\$net2ftp_settings["default_skin"]     = "shinra";
\$net2ftp_settings["help_text"] = "";
\$net2ftp_settings["help_link"] = "";
\$net2ftp_settings["error_reporting"] = "standard";
\$net2ftp_settings["fix_png"] = "yes";
\$net2ftp_settings["encryption_string"] = "462E16JHUI3F369BD9F4DBEE0A926F8F14FFB3";
\$net2ftp_settings["admin_username"] = "admin";
\$net2ftp_settings["admin_password"] = "(apen)";
\$net2ftp_settings["message_browse"] = "";
\$net2ftp_settings["use_database"] = "no"; // "yes" or "no"
\$net2ftp_settings["dbusername"] = "";
\$net2ftp_settings["dbpassword"] = "";
\$net2ftp_settings["dbname"]     = "";
\$net2ftp_settings["dbserver"]   = "localhost"; // on many configurations, this is "localhost"
\$net2ftp_settings["log_access"] = "yes";
\$net2ftp_settings["log_error"]  = "yes";
\$net2ftp_settings["log_length_months"] = 12; // number of months
\$net2ftp_settings["use_syslog"] = "no";
\$net2ftp_settings["syslog_priority"] = LOG_NOTICE;
\$net2ftp_settings["syslog_facility"] = LOG_MAIL;
\$net2ftp_settings["syslog_ident"] = "net2ftp";
\$net2ftp_settings["max_filesize"]  = "10000000";  // in Bytes, default 10 MB
\$net2ftp_settings["check_consumption"] = "no";
\$net2ftp_settings["max_consumption_ipaddress_datatransfer"] = 50000000; // per IP address
\$net2ftp_settings["max_consumption_ftpserver_datatransfer"] = 50000000; // per FTP server
\$net2ftp_settings["max_consumption_ipaddress_executiontime"] = 1500; // per IP address
\$net2ftp_settings["max_consumption_ftpserver_executiontime"] = 1500; // per FTP server
\$net2ftp_settings["check_homedirectory"] = "no";
\$net2ftp_settings["application_version"] = "1.0";
\$net2ftp_settings["application_build_nr"] = "47";
\$net2ftp_settings["net2ftpdotcom"] = "no";
\$net2ftp_settings["show_ads"] = "no";
?>
EOF

cat << EOF >> $DST/$DIR2/settings_authorizations.inc.php
<?php
\$net2ftp_settings["check_authorization"] = "yes";
\$net2ftp_settings["allowed_ftpservers"][1] = "localhost";
\$net2ftp_settings["banned_ftpservers"][1] = "NONE";
\$net2ftp_settings["allowed_ftpserverport"] = "21";
\$net2ftp_settings["allowed_addresses"][1] = "ALL";
\$net2ftp_settings["banned_addresses"][1] = "NONE";
\$net2ftp_settings["banned_keywords"][1] = "paypal";
\$net2ftp_settings["banned_keywords"][2] = "ebay";
\$net2ftp_settings["banned_keywords"][3] = "wachoviabank";
\$net2ftp_settings["banned_keywords"][4] = "wellsfargo";
\$net2ftp_settings["banned_keywords"][5] = "bankwest";
\$net2ftp_settings["banned_keywords"][6] = "hsbc";
\$net2ftp_settings["banned_keywords"][7] = "halifax-online";
\$net2ftp_settings["banned_keywords"][8] = "lloydstsb";
\$net2ftp_settings["banned_keywords"][9] = "egg.com";
?>
EOF
