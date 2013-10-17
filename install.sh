#!/bin/bash

BASE=$(dirname $0)

dialog --yesno "Do you want install phpMyAdmin?" 7 40 && $BASE/helpers/install_phpmyadmin.sh

dialog --yesno "Do you want install net2ftp?" 7 40 && $BASE/helpers/install_net2ftp.sh

dialog --yesno "Do you want install Nginx scripts?" 7 40 && $BASE/helpers/install_scripts.sh

