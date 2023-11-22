#!/bin/bash

source "variables.sh"

read -p "${Server_sh_read_1}" text

cd ../..
mkdir "$text"

cd "${directory_data}"
rm */cache.fcz
rm */bin_*cache.fcz

cd "../${directory_main}/server"
chmod u+x ./configure
./configure 1

make

cd "../../../$text"
ln -s "../${directory_main}/server/X-Server" "$server_name"
if [ ! -h categories ];then
    ln -s "../${directory_data}/categories" .
fi
if [ ! -h objects ];then
    ln -s "../${directory_data}/objects" .
fi
if [ ! -h transitions ];then
    ln -s "../${directory_data}/transitions" .
fi
if [ ! -h tutorialMaps ];then
    ln -s "../${directory_data}/tutorialMaps" .
fi
if [ ! -h dataVersionNumber.txt ];then
    ln -s "../${directory_data}/dataVersionNumber.txt" .
fi
if [ ! -b settings ];then
    cp -rf "../${directory_main}/server/settings" .
fi

cd settings
read -p "port[8005]:" port
echo "$port" > port.ini
read -p "ServerID[testServer]:" serverID
echo "$serverID" > serverID.ini

