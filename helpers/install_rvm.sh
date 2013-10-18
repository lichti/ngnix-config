#!/bin/bash

\curl -L https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | sudo bash -s stable

source /etc/profile.d/rvm.sh

rvm --debug requirements
