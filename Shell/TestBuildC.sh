#!/bin/bash

source "variables.sh"

cd ../..

cd "${directory_data}"
rm */cache.fcz
rm */bin_*cache.fcz

cd "../${directory_main}"
chmod u+x ./configure
./configure 1 || exit 1

cd gameSource
make || exit 1

if [ ! -h animations ]
then
	ln -s "../../${directory_data}/animations" .	
fi

if [ ! -h categories ]
then
	ln -s "../../${directory_data}/categories" .	
fi

if [ ! -h ground ]
then
	ln -s "../../${directory_data}/ground" .	
fi

if [ ! -h music ]
then
	ln -s "../../${directory_data}/music" .	
fi

if [ ! -h objects ]
then
	ln -s "../../${directory_data}/objects" .	
fi

if [ ! -h sounds ]
then
	ln -s "../../${directory_data}/sounds" .	
fi

if [ ! -h sprites ]
then
	ln -s "../../${directory_data}/sprites" .	
fi

if [ ! -h transitions ]
then
	ln -s "../../${directory_data}/transitions" .	
fi

if [ ! -h dataVersionNumber.txt ]
then
	ln -s "../../${directory_data}/dataVersionNumber.txt" .	
fi

if [ ! -h overlays ]
then
    ln -s "../../${directory_data}/overlays" .
fi

if [ ! -h scenes ]
then
    ln -s "../../${directory_data}/scenes" .
fi

echo 1 > settings/useCustomServer.ini
echo test@test.com > settings/email.ini
echo testPassword > settings/accountKey.ini
