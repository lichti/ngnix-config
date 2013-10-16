#!/bin/bash 

FILE="phpMyAdmin-4.0.8-all-languages.tar.bz2"
URL="http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.8/phpMyAdmin-4.0.8-all-languages.tar.bz2"
TMP=/tmp
DST=/usr/local/share
DIR1=phpMyAdmin-4.0.8-all-languages
DIR2=phpmyadmin

wget -c $URL -O $TMP/$FILE

if [ ! -d $DST ]; then
	mkdir -p $DST
fi

if [ -d $DST/$DIR2 ];then
	rm -rf $DST/$DIR2
fi

tar xjvf $TMP/$FILE -C $DST
rm $TMP/$FILE

mv $DST/$DIR1 $DST/$DIR2

cat << EOF >> $DST/$DIR2/config.inc.php
<?php
/* Servers configuration */
\$i = 0;

/* Server: Bauer [1] */
\$i++;
\$cfg['Servers'][\$i]['verbose'] = 'Bauer';
\$cfg['Servers'][\$i]['host'] = 'localhost';
\$cfg['Servers'][\$i]['port'] = '';
\$cfg['Servers'][\$i]['socket'] = '';
\$cfg['Servers'][\$i]['connect_type'] = 'tcp';
\$cfg['Servers'][\$i]['extension'] = 'mysqli';
\$cfg['Servers'][\$i]['auth_type'] = 'cookie';
\$cfg['Servers'][\$i]['user'] = 'root';
\$cfg['Servers'][\$i]['password'] = '';
\$cfg['Servers'][\$i]['pmadb'] = 'phpmyadmin';
\$cfg['Servers'][\$i]['controluser'] = 'pma';
\$cfg['Servers'][\$i]['controlpass'] = 'pmapass';
\$cfg['Servers'][\$i]['bookmarktable'] = 'pma_bookmark';
\$cfg['Servers'][\$i]['relation'] = 'pma_relation';
\$cfg['Servers'][\$i]['userconfig'] = 'pma_userconfig';
\$cfg['Servers'][\$i]['table_info'] = 'pma_table_info';
\$cfg['Servers'][\$i]['column_info'] = 'pma_column_info';
\$cfg['Servers'][\$i]['history'] = 'pma_history';
\$cfg['Servers'][\$i]['recent'] = 'pma_recent';
\$cfg['Servers'][\$i]['table_uiprefs'] = 'pma_table_uiprefs';
\$cfg['Servers'][\$i]['tracking'] = 'pma_tracking';
\$cfg['Servers'][\$i]['table_coords'] = 'pma_table_coords';
\$cfg['Servers'][\$i]['pdf_pages'] = 'pma_pdf_pages';
\$cfg['Servers'][\$i]['designer_coords'] = 'pma_designer_coords';
\$cfg['Servers'][\$i]['controlhost'] = 'localhost';
\$cfg['Servers'][\$i]['verbose_check'] = false;

/* End of servers configuration */

\$cfg['DefaultLang'] = 'pt_BR';
\$cfg['ServerDefault'] = 1;
\$cfg['blowfish_secret'] = '4fe6bbe3e80771.24378565';
\$cfg['UploadDir'] = '';
\$cfg['SaveDir'] = '';
?>
EOF

