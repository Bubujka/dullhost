#!/bin/bash
echo 'Acquire::http { Proxy "http://192.168.56.1:3142"; };' > /etc/apt/apt.conf.d/02proxy
cp /vagrant/sakura /usr/local/bin
sakura init
